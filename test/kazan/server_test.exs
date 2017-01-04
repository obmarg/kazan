defmodule Kazan.ServerTest do
  use ExUnit.Case

  describe "Server.from_kubeconfig" do
    import Kazan.Server, only: [from_kubeconfig: 1, from_kubeconfig: 2]

    test "loads default context" do
      config = from_kubeconfig("test/test_data/kubeconfig")
      assert config.url == "https://172.17.4.99:443"
      assert config.ca
      assert config.auth
      assert config.auth.certificate
      assert config.auth.key
    end

    test "can load other context" do
      config = from_kubeconfig("test/test_data/kubeconfig", context: "other-context")

      assert config.url == "https://172.17.4.99:443"
      assert config.ca
      refute config.auth
    end

    test "can load non default user" do
      config = from_kubeconfig("test/test_data/kubeconfig", user: "other-user")

      assert config.url == "https://172.17.4.99:443"
      assert config.ca
      refute config.auth
    end
  end
end
