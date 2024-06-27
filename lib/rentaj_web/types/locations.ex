defmodule RentajWeb.Types.Locations do
  use Absinthe.Schema.Notation

  object :location do
    field :id, non_null(:id)
    field :address, non_null(:string)
    field :city, non_null(:string)
    field :postal_code, non_null(:integer)
    field :lat, non_null(:string)
    field :long, non_null(:string)
  end

  input_object :create_location_input do
    field :address, non_null(:string)
    field :city, non_null(:string)
    field :postal_code, non_null(:integer)
  end
end
