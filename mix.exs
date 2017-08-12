defmodule HammerBackendEcto.Mixfile do
  use Mix.Project

  def project do
    [
      app: :hammer_backend_ecto,
      description: "Ecto backend for Hammer rate-limiter",
      package: [name: :hammer_backend_ecto,
                maintainers: ["Shane Kilkelly (shane@kilkelly.me)"],
                licenses: ["MIT"],
                links: %{"GitHub" => "https://github.com/ExHammer/hammer-backend-ecto"}],
      source_url: "https://github.com/ExHammer/hammer-backend-ecto",
      homepage_url: "https://github.com/ExHammer/hammer-backend-ecto",
      version: "0.1.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env == :prod,
      deps: deps()
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
    [{:redix, "~> 0.6"},
     {:mock, "~> 0.2.0", only: :test},
     {:ex_doc, "~> 0.16", only: :dev}]
  end
end
