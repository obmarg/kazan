defmodule Kazan.Server do
  @moduledoc """
  Kazan.Server is a struct containing connection details for a kube server.
  """
  alias __MODULE__

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
      "token-key" => token_key
    } = auth_config

    %Kazan.Server.TokenAuth{
      token: resolve_token(cmd_path, cmd_args, token_key)
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
end
