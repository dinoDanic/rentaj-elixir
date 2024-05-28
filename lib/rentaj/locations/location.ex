defmodule Rentaj.Locations.Location do
  use Ecto.Schema
  import Ecto.Changeset

  schema "locations" do
    field :address, :string
    field :city, :string
    field :postal_code, :string

    has_one :item, Rentaj.Items.Item

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(location, attrs) do
    location
    |> cast(attrs, [:address, :city, :postal_code, :item_id])
    |> validate_required([:address, :city, :postal_code, :item_id])
  end
end
