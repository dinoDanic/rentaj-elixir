defmodule Rentaj.Repo.Migrations.AddBoolAndPriceToItems do
  use Ecto.Migration

  def change do
    alter table(:items) do
      add :price_per_day, :decimal, precision: 10, scale: 2, null: false
      add :delivery, :bool, default: false, null: false
      add :pick_up, :bool, default: false, null: false
    end
  end
end
