defmodule HammerBackendEcto.Mixfile do
  use Mix.Project

  @url "https://github.com/ExHammer/hammer-backend-ecto"
  @app :hammer_backend_ecto

  def project do
    [
      app: @app,
      version: "0.1.0",
      elixir: "~> 1.5",

      # Package information:
      description: "Ecto backend for Hammer rate-limiter",
      package: package(),
      source_url: @url,
      homepage_url: @url,

      elixirc_paths: elixirc_paths(Mix.env),
      start_permanent: Mix.env == :prod,

      deps: deps(),
      aliases: aliases(),

      # Test coverage:
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        "coveralls": :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test,
      ],

      # Dialyzer:
      dialyzer: [plt_add_deps: :apps_direct, plt_add_apps: [:ecto]]
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [mod: {Hammer.Backend.Ecto, []}, extra_applications: [:logger]]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
     # Ecto:
     {:ecto, "~> 2.1"},

     # Test env:
     {:postgrex, "~> 0.13", only: [:dev, :test]},

     # Docs:
     {:ex_doc, "~> 0.16", only: :dev},

     # Test tools:
     {:excoveralls, "~> 0.5", only: :test},
     {:credo, "~> 0.8", only: [:dev, :test], runtime: false},
     {:dialyxir, "~> 0.5", only: [:dev], runtime: false},
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "priv", "test/support"]
  defp elixirc_paths(:dev),  do: ["lib", "priv"]
  defp elixirc_paths(_),     do: ["lib"]

  defp package do
    [
      name: @app,
      maintainers: ["Shane Kilkelly (shane@kilkelly.me)"],
      licenses: ["MIT"],
      links: %{"GitHub" => @url}
    ]
  end

  # Aliases are shortcut or tasks specific to the current project.
  # For example, to create, migrate and run the seeds file at once:
  #
  #     $ mix ecto.setup
  #
  # See the documentation for `Mix` for more info on aliases.
  defp aliases do
    [
      "ecto.setup": [
        "ecto.create",
        "ecto.migrate"
      ],
      "ecto.reset": [
        "ecto.drop",
        "ecto.setup",
      ]
    ]
  end
end
