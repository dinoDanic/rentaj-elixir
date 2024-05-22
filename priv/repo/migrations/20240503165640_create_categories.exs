defmodule Rentaj.Repo.Migrations.CreateCategories do
  use Ecto.Migration

  def change do
    create table(:categories) do
      add :name, :string
      add :category_id, references(:categories, on_delete: :nothing)
      add :image_url, :string

      timestamps(type: :utc_datetime)
    end

    create index(:categories, [:category_id])
  end
end
