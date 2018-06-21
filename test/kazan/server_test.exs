defmodule Kazan.ServerTest do
  use ExUnit.Case

  alias Kazan.Server
  alias Kazan.Server.{CertificateAuth, TokenAuth}

  describe "Server.from_kubeconfig" do
    test "loads default context" do
      config = Server.from_kubeconfig("test/test_data/kubeconfig")
      assert config.url == "https://172.17.4.99:443"
      assert config.ca_cert
      assert config.auth
      assert config.auth.certificate
      assert config.auth.key
    end

    test "can load other context" do
      config =
        Server.from_kubeconfig(
          "test/test_data/kubeconfig",
          context: "other-context"
        )

      assert config.url == "https://172.17.4.99:443"
      assert config.ca_cert
      refute config.auth
    end

    test "can load non default user" do
      config =
        Server.from_kubeconfig("test/test_data/kubeconfig", user: "other-user")

      assert config.url == "https://172.17.4.99:443"
      assert config.ca_cert
      refute config.auth
    end

    test "can load user from auth-provider" do
      config =
        Server.from_kubeconfig("test/test_data/kubeconfig", user: "user-with-auth-provider")
      assert config.auth == %TokenAuth{token: "the-token"}
    end
  end

  describe "Server.from_map" do
    test "converts the map into a server struct" do
      server =
        Server.from_map(%{
          url: "http://example.com",
          ca_cert: "abcd",
          insecure_skip_tls_verify: false
        })

      assert server == %Server{
               url: "http://example.com",
               ca_cert: "abcd",
               insecure_skip_tls_verify: false,
               auth: nil
             }
    end

    test "converts token auth" do
      server = Server.from_map(%{auth: %{token: "abcde"}})
      assert server.auth == %TokenAuth{token: "abcde"}
    end

    test "converts certificate auth" do
      server = Server.from_map(%{auth: %{certificate: "abcde", key: "fghij"}})
      assert server.auth == %CertificateAuth{certificate: "abcde", key: "fghij"}
    end

    test "raises on unknown auth" do
      assert_raise RuntimeError, fn ->
        Server.from_map(%{auth: %{something: "abcd"}})
      end
    end
  end
end
