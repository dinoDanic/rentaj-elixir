defmodule Rentaj.Repo.Migrations.CreateItems do
  use Ecto.Migration

  def change do
    create table(:items) do
      add :name, :string, null: false
      add :description, :string
      add :category_id, references(:categories, on_delete: :delete_all), null: false
      add :user_id, references(:users, on_delete: :delete_all), null: false
      add :location_id, references(:locations, on_delete: :delete_all), null: false
      add :price_per_day, :decimal, precision: 10, scale: 2, null: false
      add :delivery, :bool, default: false, null: false
      add :active, :bool, default: true, null: false
      add :pick_up, :bool, default: false, null: false
      add :capara, :decimal, precision: 10, scale: 2, null: true

      timestamps(type: :utc_datetime)
    end

    create index(:items, [:category_id, :location_id, :user_id])
  end
end
