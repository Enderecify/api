defmodule EnderecifyApi.MixProject do
  use Mix.Project

  @version "1.0.0"

  def project do
    [
      app: :enderecify_api,
      version: @version,
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      package: package(),
      deps: deps(),
      source_url: "https://github.com/Enderecify/api"
    ]
  end

  defp package do
    [
      description: "GraphQL API used at enderecify.com",
      files: ["lib", "mix.exs", "README*"],
      maintainers: ["Rafael Garcia"],
      licenses: ["MIT"],
      links: %{
        site: "https://enderecify.com",
        github: "https://github.com/enderecify/api"
      }
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:phoenix_ecto, "~> 3.3"},
      {:absinthe, "~> 1.4.13"},
      {:absinthe_ecto, "~> 0.1.3"},
      {:ex_doc, ">= 0.0.0", only: :dev}
    ]
  end
end
