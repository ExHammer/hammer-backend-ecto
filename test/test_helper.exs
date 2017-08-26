ExUnit.start()

Mix.Task.run("ecto.setup", ~w(-r Hammer.Repo --quiet))
Ecto.Adapters.SQL.Sandbox.mode(Hammer.Repo, :manual)
