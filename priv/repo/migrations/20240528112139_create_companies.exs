defmodule Rentaj.Repo.Migrations.CreateCompanies do
  use Ecto.Migration

  def change do
    create table(:companies) do
      add :name, :string, null: false
      add :oib, :string, null: false
      add :location_id, references(:locations, on_delete: :delete_all), null: false

      timestamps(type: :utc_datetime)
    end

    create index(:companies, [:location_id])

    alter table(:users) do
      add :company_id, references(:companies, on_delete: :nothing), null: true
    end

    create index(:users, [:company_id])
  end
end
