defmodule Rentaj.Repo.Migrations.CreateOrders do
  use Ecto.Migration

  def change do
    create table(:orders) do
      add :item_id, references(:items, on_delete: :nothing), null: false
      add :renter_id, references(:users, on_delete: :nothing), null: false
      add :customer_id, references(:users, on_delete: :nothing), null: false
      add :start_date, :utc_datetime, null: false
      add :end_date, :utc_datetime, null: false
      add :delivery, :boolean, null: false
      add :pick_up, :boolean, null: false
      add :status, :order_status, null: false

      timestamps(type: :utc_datetime)
    end

    create index(:orders, [:renter_id, :customer_id])
  end
end
