defmodule Rentaj.Repo.Migrations.CreateImages do
  use Ecto.Migration

  def change do
    create table(:images) do
      add :name, :string, null: false
      add :item_id, references(:items, on_delete: :delete_all), null: false
      add :image_url, :string, null: false

      timestamps(type: :utc_datetime)
    end

    create index(:images, [:item_id])
  end
end
