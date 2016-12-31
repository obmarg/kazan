defmodule Kazan.Mixfile do
  use Mix.Project

  def project do
    [app: :kazan,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),

     # Hex.pm stuff
     package: package(),
     description: description(),

     # Docs
     name: "Kazan",
     source_url: "https://github.com/obmarg/kazan",
     homepage_url: "https://github.com/obmarg/kazan",
     docs: [main: "readme",
            extras: ["README.md"]]
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger, :httpoison]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [{:poison, "~> 3.0"},
     {:httpoison, "~> 0.10.0"},
     {:ex_doc, "~> 0.14", only: :dev}]
  end

  defp package do
    [name: :kazan,
     licenses: ["MIT"],
     maintainers: ["Graeme Coupar"],
     links: %{"GitHub" => "https://github.com/obmarg/kazan"}]
  end

  def description do
    "Kubernetes API client for Elixir"
  end
end
