defmodule RentajWeb.Types.Companies do
  alias RentajWeb.Resolvers.LocationResolver
  use Absinthe.Schema.Notation

  object :company do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :iob, non_null(:string)

    field :location, non_null(:location) do
      resolve(&LocationResolver.preload_location/3)
    end
  end
end
