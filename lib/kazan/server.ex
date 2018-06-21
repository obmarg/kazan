defmodule Kazan.Server do
  @moduledoc """
  Kazan.Server is a struct containing connection details for a kube server.
  """
  alias __MODULE__
  alias Server.{ProviderAuth}

  @type auth_t ::
          nil | Kazan.Server.CertificateAuth.t() | Kazan.Server.TokenAuth.t()

  defstruct url: nil,
            ca_cert: nil,
            auth: nil,
            insecure_skip_tls_verify: nil

  @type t :: %{
          url: String.t(),
          insecure_skip_tls_verify: Boolean.t(),
          ca_cert: String.t() | nil,
          auth: auth_t
        }

  @doc """
  Parses Kube server details from a provided kubeconfig file.

  Will use the current-context provided in the file by default, though this and other details can be overridden via `options`

  Note: any default namespaces provided in the kubecontext will be ignored.

  ### Options

  * `context` can be used to override the default context we pull from the file.
  * `user` can be used to override the default user we pull from the file.
  * `cluster` can be used to override the default cluster we pull from the file.
  """
  @spec from_kubeconfig(String.t(), Keyword.t()) :: t
  def from_kubeconfig(config_file, options \\ []) do
    data = YamlElixir.read_from_file!(config_file)

    basepath = config_file |> Path.absname() |> Path.dirname()

    context_name = options[:context] || data["current-context"]
    context = find_by_name(data["contexts"], context_name)["context"]

    user_name = options[:user] || context["user"]
    user = find_by_name(data["users"], user_name)["user"]

    cluster_name = options[:cluster] || context["cluster"]
    cluster = find_by_name(data["clusters"], cluster_name)["cluster"]

    %__MODULE__{
      url: cluster["server"],
      ca_cert: get_cert(cluster, basepath),
      auth: auth_from_user(user, basepath),
      insecure_skip_tls_verify: cluster["insecure-skip-tls-verify"]
    }
  end

  @doc """
  Server that will connect to the cluster that kazan is running on.

  This will speak to the server via the `kubernetes` domain name, using the service account credentials that are stored on the filesystem.

  [See the Kubernetes documentation for more information](https://kubernetes.io/docs/tasks/access-application-cluster/access-cluster/#accessing-the-api-from-a-pod).
  """
  @spec in_cluster(Keyword.t()) :: t
  def in_cluster(_options \\ []) do
    basepath = "/var/run/secrets/kubernetes.io/serviceaccount"
    host = System.get_env("KUBERNETES_SERVICE_HOST")
    port = System.get_env("KUBERNETES_SERVICE_PORT")

    %__MODULE__{
      url: "https://#{host}:#{port}",
      ca_cert: cert_from_pem("ca.crt", basepath),
      auth: %Kazan.Server.TokenAuth{
        token: Path.join([basepath, "token"]) |> File.read!()
      }
    }
  end

  # Server.from_map can be used to convert a map into a Server.t. Useful when
  # working with mix config, where the kazan structs are unavaliable.
  @doc false
  @spec from_map(Server.t() | Map.t()) :: Server.t()
  def from_map(%Server{} = server), do: server

  def from_map(%{} = map) do
    server = struct(Server, map)

    auth =
      case server.auth do
        %{token: _} = token_auth ->
          struct(Server.TokenAuth, token_auth)

        %{certificate: _, key: _} = cert_auth ->
          struct(Server.CertificateAuth, cert_auth)

        nil ->
          nil

        other ->
          raise """
          Unknown kazan auth map format: #{inspect(other)}".

          See Kazan.Server.from_map/1
          """
      end

    %{server | auth: auth}
  end

  @doc """
  Some auth methods require that auth be pulled from a provider. This does that.

  For authentication methods that don't require this, this will just return the
  server unchanged.

  ### Google Kubernetes Engine (GKE)

  In particular, this function is required to support connecting to GKE clusters
  when authentication is configured locally using gcloud.

  Note that the `allow_command_execution` option must be passed in as true for
  this function to run external commands such as the gcloud auth provider. It's
  recommended that you tie this parameter in to your app config or mix env
  somehow so this functionality is disabled on production. Otherwise this could
  provide a way for attackers to execute arbitrary commands.  For example:

      {:ok, server} =
        Kazan.Server.from_kubeconfig("config.file")
        |> Kazan.Server.resolve_auth(
          allow_command_execution: Application.get_env(:my_app, :allow_k8s_command_execution)
        )

  ### Refreshing

  If `resolve_auth` is passed a Server that already has it's auth resolved, it
  will not request new auth from the auth provider, unless the current token has
  expired. This means that it should be safe to call this function before every
  call to kubernetes, provided you cache the result of the call for future use.

  ### Options

  - `allow_command_execution` controls whether kazan will run an external
    command in order to fetch authentication tokens. See the section on google
    kubernetes engine above.
  - `force` should be set to true if you want to request a token from the auth
    provider regardless of whether we have one already or not.
  """
  def resolve_auth(
        %Server{auth: %ProviderAuth{token: nil} = auth} = server,
        opts
      ) do
    if Keyword.get(opts, :allow_command_execution) == true do
      case fetch_auth_from_provider(server.auth) do
        {:ok, new_auth} ->
          {:ok, %{server | auth: new_auth}}

        other ->
          other
      end
    else
      raise "Kazan.Server.resolve_auth requires allow_command_execution to be set when using ProviderAuth.  Please see the Kazan.Server.resolve_auth docs for more information."
    end
  end

  def resolve_auth(%Server{auth: %ProviderAuth{} = auth} = server, opts) do
    # This clause handles the case where we've already got a token.
    # Will only refresh if we're forcing, or the token has expired.
    should_resolve =
      Keyword.get(opts, :force) ||
        DateTime.compare(auth.expiry, DateTime.utc_now()) != :gt

    if should_resolve do
      resolve_auth(%{server | auth: %{auth | token: nil}}, opts)
    else
      {:ok, server}
    end
  end

  def resolve_auth(%Server{} = server, _opts) do
    {:ok, server}
  end

  @doc """
  Like `resolve_auth/2` but raises on error.

  See `resolve_auth/2` for more details
  """
  def resolve_auth!(server, opts) do
    case resolve_auth(server, opts) do
      {:ok, server} ->
        server

      {:error, _} = err ->
        raise "Error resolving_auth: #{inspect(err)}"
    end
  end

  # Fetches authorization from the configured auth provider.
  defp fetch_auth_from_provider(%ProviderAuth{} = auth) do
    with {cmd_response, 0} =
           System.cmd(auth.config.cmd_path, auth.config.cmd_args),
         {:ok, data} = Poison.decode(cmd_response) do
      {:ok, expiry, _} =
        data |> get_in(auth.config.expiry_key_path) |> DateTime.from_iso8601()

      new_auth = %{
        auth
        | token: get_in(data, auth.config.token_key_path),
          expiry: expiry
      }

      {:ok, new_auth}
    else
      {:error, _} = err ->
        err

      {cmd_response, err_code}
      when is_binary(cmd_response) and is_integer(err_code) ->
        {:error, {:auth_provider_fail, cmd_response}}

      other ->
        other
    end
  end

  @spec find_by_name([Map.t()], String.t()) :: Map.t()
  defp find_by_name(elems, name) do
    Enum.find(elems, fn elem -> elem["name"] == name end)
  end

  @spec get_cert(Map.t(), String.t()) :: binary
  defp get_cert(%{"certificate-authority" => certfile}, basepath) do
    cert_from_pem(certfile, basepath)
  end

  defp get_cert(%{"certificate-authority-data" => certdata}, _) do
    cert_from_base64(certdata)
  end

  @spec auth_from_user(Map.t(), String.t()) :: auth_t
  defp auth_from_user(
         %{"client-certificate" => cert_file, "client-key" => key_file},
         basepath
       ) do
    %Kazan.Server.CertificateAuth{
      certificate: cert_from_pem(cert_file, basepath),
      key: private_key_from_pem(key_file, basepath)
    }
  end

  defp auth_from_user(
         %{"token" => token},
         _
       ) do
    %Kazan.Server.TokenAuth{
      token: token
    }
  end

  defp auth_from_user(
         %{
           "client-certificate-data" => cert_data,
           "client-key-data" => key_data
         },
         _
       ) do
    %Kazan.Server.CertificateAuth{
      certificate: cert_from_base64(cert_data),
      key: private_key_from_base64(key_data)
    }
  end

  defp auth_from_user(%{"auth-provider" => %{"config" => auth_config}}, _) do
    %{
      "cmd-path" => cmd_path,
      "cmd-args" => cmd_args,
      "token-key" => token_key,
      "expiry-key" => expiry_key
    } = auth_config

    %Kazan.Server.ProviderAuth{
      config: %{
        cmd_path: cmd_path,
        cmd_args: String.split(cmd_args, " "),
        token_key_path: json_path_to_key_list(token_key),
        expiry_key_path: json_path_to_key_list(expiry_key)
      }
    }
  end

  defp auth_from_user(_user, _basepath) do
    nil
  end

  defp resolve_token(cmd_path, cmd_args, token_key) do
    with {cmd_response, 0} = System.cmd(cmd_path, String.split(cmd_args, " ")),
         {:ok, data} = Poison.decode(cmd_response) do
      token_key
      # remove enclosing { and }
      |> String.slice(1, String.length(token_key) - 2)
      # split ".credential.access_token" into ["", "credential", "access_token"]
      |> String.split(".")
      # remove the leading empty
      |> Enum.reject(fn key -> key == "" end)
      # traverse the dictionary using the keys
      |> Enum.reduce(data, fn key, data -> Map.get(data, key) end)
    end
  end

  # Reads data of a particular type from a .pem file.
  defp cert_from_pem(nil, _), do: nil

  defp cert_from_pem(filename, basepath) do
    filename
    |> resolve_filename(basepath)
    |> File.read!()
    |> :public_key.pem_decode()
    |> Enum.find_value(fn
      {:Certificate, data, _} -> data
      _ -> nil
    end)
  end

  defp cert_from_base64(nil), do: nil

  defp cert_from_base64(encoded_cert) do
    case Base.decode64(encoded_cert) do
      {:ok, cert_data} ->
        :public_key.pem_decode(cert_data)
        |> Enum.find_value(fn
          {:Certificate, data, _} -> data
          _ -> nil
        end)

      _ ->
        nil
    end
  end

  @private_key_atoms [
    :RSAPrivateKey,
    :DSAPrivateKey,
    :ECPrivateKey,
    :PrivateKeyInfo
  ]

  defp private_key_from_pem(nil, _), do: nil

  defp private_key_from_pem(filename, basepath) do
    filename
    |> resolve_filename(basepath)
    |> File.read!()
    |> :public_key.pem_decode()
    |> Enum.find_value(fn
      {type, data, _} when type in @private_key_atoms -> {type, data}
      _ -> false
    end)
  end

  defp private_key_from_base64(nil), do: nil

  defp private_key_from_base64(encoded_key) do
    case Base.decode64(encoded_key) do
      {:ok, key_data} ->
        :public_key.pem_decode(key_data)
        |> Enum.find_value(fn
          {type, data, _} when type in @private_key_atoms -> {type, data}
          _ -> false
        end)

      _ ->
        nil
    end
  end

  # "resolves" the path a filename that may be relative or absolute.
  # If absolute, then just uses that filename. Otherwise assumes it is relative
  # to the basepath. This is so that paths in kubeconfig can be relative to the
  # kubeconfig itself, rather than the current directory.
  @spec resolve_filename(String.t(), String.t()) :: String.t()
  defp resolve_filename(filename, basepath) do
    case Path.type(filename) do
      :absolute -> filename
      _ -> Path.join([basepath, filename])
    end
  end

  # Kube config files use JSONPath to express the path to certain keys in JSON.
  # We approximate support for that by splitting into a list of keys to lookup.
  # Definitely some things we don't support but hopefully this is good enough.
  # Essentially all we do is take `{.blah.blah}` and convert to `["blah", "blah"]`
  defp json_path_to_key_list(jsonpath) do
    jsonpath
    |> String.trim_leading("{")
    |> String.trim_trailing("}")
    |> String.split(".")
    |> Enum.reject(fn key -> key == "" end)
  end
end
