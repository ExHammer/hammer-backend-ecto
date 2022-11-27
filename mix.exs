defmodule HammerBackendEcto.Mixfile do
  use Mix.Project

  @version "0.2.0"

  def project do
    [
      app: :hammer_backend_ecto,
      description: "Ecto backend for Hammer rate-limiter",
      source_url: "https://github.com/ExHammer/hammer-backend-ecto",
      homepage_url: "https://github.com/ExHammer/hammer-backend-ecto",
      version: "#{@version}",
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs(),
      package: package(),
      test_coverage: [summary: [threshold: 75]]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  def docs do
    [
      main: "overview",
      extras: ["guides/Overview.md", "CHANGELOG.md"],
      source_ref: "v#{@version}",
      main: "overview",
      formatters: ["html", "epub"]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:credo, "~> 1.6", only: [:dev, :test]},
      {:dialyxir, "~> 1.1", only: [:dev], runtime: false},
      {:ex_doc, "~> 0.16", only: :dev}
    ]
  end

  defp package do
    [
      name: :hammer_backend_ecto,
      maintainers: ["Emmanuel Pinault", "Shane Kilkelly (shane@kilkelly.me)"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/ExHammer/hammer-backend-ecto",
        "Changelog" => "https://github.com/ExHammer/hammer-backend-ecto/blob/master/CHANGELOG.md"
      }
    ]
  end
end
