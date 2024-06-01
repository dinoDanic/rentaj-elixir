defmodule RentajWeb.Types.Items do
  alias RentajWeb.Resolvers.LocationResolver
  use Absinthe.Schema.Notation

  import_types(RentajWeb.Scalars.Decimal)

  input_object :filter_items do
    field :active, :boolean
  end

  object :item do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :price_per_day, non_null(:decimal)
    field :delivery, non_null(:boolean)
    field :pick_up, non_null(:boolean)
    field :description, :string

    field :location, non_null(:location) do
      resolve(&LocationResolver.preload_location/3)
    end
  end

  input_object :create_item_input do
    field :name, non_null(:string)
    field(:category_id, non_null(:string))
  end
end
