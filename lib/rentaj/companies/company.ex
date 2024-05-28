defmodule Rentaj.Companies.Company do
  use Ecto.Schema
  import Ecto.Changeset

  schema "companies" do
    field :name, :string
    field :oib, :string

    belongs_to :location, Rentaj.Locations.Location
    has_one :user, Rentaj.Accounts.User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(company, attrs) do
    company
    |> cast(attrs, [:name, :oib, :location_id])
    |> validate_required([:name, :oib, :location_id])
  end
end
