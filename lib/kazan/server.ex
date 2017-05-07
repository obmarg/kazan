defmodule Kazan.Server do
  @moduledoc """
  Kazan.Server is a struct containing connection details for a kube server.
  """

  @type auth_t :: nil | Kazan.Server.CertificateAuth.t | Kazan.Server.TokenAuth.t

  defstruct [
    url: nil, 
    ca_cert: nil, 
    auth: nil,
    insecure_skip_tls_verify: nil
  ]

  @type t :: %{
    url: String.t,
    insecure_skip_tls_verify: Boolean.t,
    ca_cert: String.t | nil,
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
  @spec from_kubeconfig(String.t, Keyword.t) :: t
  def from_kubeconfig(config_file, options \\ []) do
    data = YamlElixir.read_from_file(config_file)

    basepath = config_file |> Path.absname |> Path.dirname

    context_name = options[:context] || data["current-context"]
    context = find_by_name(data["contexts"], context_name)["context"]

    user_name = options[:user] || context["user"]
    user = find_by_name(data["users"], user_name)["user"]

    cluster_name = options[:cluster] || context["cluster"]
    cluster = find_by_name(data["clusters"], cluster_name)["cluster"]

    %__MODULE__{
      url: cluster["server"],
      ca_cert: cert_from_pem(cluster["certificate-authority"], basepath),
      auth: auth_from_user(user, basepath),
      insecure_skip_tls_verify: cluster["insecure-skip-tls-verify"]
    }
  end

  @spec find_by_name([Map.t], String.t) :: Map.t
  defp find_by_name(elems, name) do
    Enum.find(elems, fn (elem) -> elem["name"] == name end)
  end

  @spec auth_from_user(Map.t, String.t) :: auth_t
  defp auth_from_user(
    %{"client-certificate" => cert_file,
      "client-key" => key_file},
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

  defp auth_from_user(_user, _basepath) do
    nil
  end

  # Reads data of a particular type from a .pem file.
  defp cert_from_pem(nil, _), do: nil
  defp cert_from_pem(filename, basepath) do
    Path.join([basepath, filename])
    |> File.read!
    |> :public_key.pem_decode
    |> Enum.find_value(fn
      {:Certificate, data, _} -> data
      _ -> nil
    end)
  end

  @private_key_atoms [:RSAPrivateKey, :DSAPrivateKey, :ECPrivateKey, :PrivateKeyInfo]

  defp private_key_from_pem(nil, _), do: nil
  defp private_key_from_pem(filename, basepath) do
    Path.join([basepath, filename])
    |> File.read!
    |> :public_key.pem_decode
    |> Enum.find_value(fn
      {type, data, _} when type in @private_key_atoms -> {type, data}
      _ -> false
    end)
  end
end
