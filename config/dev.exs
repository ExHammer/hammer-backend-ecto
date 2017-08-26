use Mix.Config

config :hammer_backend_ecto, ecto_repos: [
  Hammer.Repo
]

config :hammer_backend_ecto, Hammer.Repo,
  adapter: Ecto.Adapters.Postgres,
  pool: Ecto.Adapters.SQL.Sandbox,
  database: "hammer_backend_ecto_dev",
  username: "postgres",
  password: "",
  hostname: "localhost",
  port: "5432"
