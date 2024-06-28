defmodule Rentaj.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string, null: false
      add :password, :string, null: false
      add :contact_number, :string, null: false

      timestamps(type: :utc_datetime)
    end

    create(unique_index(:users, [:email]))
  end
end
