defmodule Rentaj.Images.Image do
  use Ecto.Schema
  import Ecto.Changeset

  schema "images" do
    field :name, :string
    field :image_url, :string

    timestamps(type: :utc_datetime)

    belongs_to :item, Rentaj.Items.Item
  end

  @doc false
  def changeset(image, attrs) do
    image
    |> cast(attrs, [:name, :image_url, :item_id])
    |> validate_required([:name, :image_url, :item_id])
  end
end
