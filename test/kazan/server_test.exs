defmodule Kazan.ServerTest do
  use ExUnit.Case

  alias Kazan.Server
  alias Kazan.Server.{CertificateAuth, TokenAuth, ProviderAuth}

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
        Server.from_kubeconfig(
          "test/test_data/kubeconfig",
          user: "user-with-auth-provider"
        )

      assert config.auth == %ProviderAuth{
               config: %{
                 cmd_path: "echo",
                 cmd_args: [
                   "{\"credential\":",
                   "{\"access_token\":",
                   "\"the-token\",",
                   "\"expiry\":",
                   "\"2018-04-23T22:23:20Z\"}}"
                 ],
                 token_key_path: ["credential", "access_token"],
                 expiry_key_path: ["credential", "expiry"]
               }
             }
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

  describe "Server.resolve_auth/2" do
    setup do
      server =
        Server.from_kubeconfig(
          "test/test_data/kubeconfig",
          user: "user-with-auth-provider"
        )

      %{server: server}
    end

    test "returns server unchanged if not ProviderAuth" do
      server = Server.from_map(%{auth: %{certificate: "abcde", key: "fghij"}})
      assert Server.resolve_auth(server, []) == {:ok, server}
    end

    test "raises if ProviderAuth and command execution disallowed", context do
      assert_raise RuntimeError, fn ->
        Server.resolve_auth(context.server, [])
      end
    end

    test "fetches auth if command execution allowed", context do
      {:ok, resolved_server} =
        Server.resolve_auth(context.server, allow_command_execution: true)

      assert resolved_server.auth.token == "the-token"
      expiry = resolved_server.auth.expiry

      assert DateTime.to_naive(expiry) == ~N[2018-04-23 22:23:20]
    end

    test "does not refetch auth if token still valid", context do
      {:ok, new_expiry} =
        DateTime.from_naive(~N[2200-01-01 00:00:00], "Etc/UTC")

      server = %{
        context.server
        | auth: %{
            context.server.auth
            | expiry: new_expiry,
              token: "other"
          }
      }

      {:ok, resolved_server} =
        Server.resolve_auth(server, allow_command_execution: true)

      assert resolved_server == server
    end

    test "refetches token if token no longer valid", context do
      {:ok, new_expiry} =
        DateTime.from_naive(~N[1999-01-01 00:00:00], "Etc/UTC")

      server = %{
        context.server
        | auth: %{
            context.server.auth
            | expiry: new_expiry,
              token: "other"
          }
      }

      {:ok, resolved_server} =
        Server.resolve_auth(server, allow_command_execution: true, force: true)

      assert resolved_server != server
    end

    test "force option forces auth even if token still valid", context do
      {:ok, new_expiry} =
        DateTime.from_naive(~N[2200-01-01 00:00:00], "Etc/UTC")

      server = %{
        context.server
        | auth: %{
            context.server.auth
            | expiry: new_expiry,
              token: %TokenAuth{token: "other"}
          }
      }

      {:ok, resolved_server} =
        Server.resolve_auth(server, allow_command_execution: true, force: true)

      assert resolved_server != server
    end
  end
end
