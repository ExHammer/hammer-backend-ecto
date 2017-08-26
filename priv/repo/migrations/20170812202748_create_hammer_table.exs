defmodule Hammer.Repo.Migrations.CreateHammerTable do
  use Ecto.Migration

  def change do
    create table(:speakers) do
      add :bucket, :string
      add :count, :integer

      timestamps()
    end

    create unique_index(:speakers, [:bucket])
  end
end
