defmodule Rentaj.Repo.Migrations.CreateLocationsTable do
  use Ecto.Migration

  def change do
    create table(:locations) do
      add :address, :string, null: false
      add :city, :string, null: false
      add :postal_code, :string, null: false

      timestamps(type: :utc_datetime)
    end
  end
end
