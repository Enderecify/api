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
      deps: deps()
    ]
  end

  defp package do
    [
      description: "API plug used at enderecify.com",
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
      {:postgrex, ">= 0.0.0"},
      {:jason, "~> 1.0"},
      {:absinthe, "~> 1.4.13"},
      {:absinthe_plug, "~> 1.4.0"},
      {:absinthe_ecto, "~> 0.1.3"}
    ]
  end
end
