defmodule Rentaj.Categories.Category do
  use Ecto.Schema
  import Ecto.Changeset

  schema "categories" do
    field :name, :string
    field :image_url, :string

    belongs_to :category, Rentaj.Categories.Category
    has_many :categories, Rentaj.Categories.Category
    has_many :items, Rentaj.Items.Item

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(category, attrs) do
    category
    |> cast(attrs, [:name, :image_url])
    |> validate_required([:name])
  end
end
