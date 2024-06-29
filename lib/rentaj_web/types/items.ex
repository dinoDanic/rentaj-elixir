defmodule RentajWeb.Types.Items do
  alias RentajWeb.Resolvers.ItemResolver
  alias RentajWeb.Resolvers.AccountResolver
  alias RentajWeb.Resolvers.LocationResolver
  use Absinthe.Schema.Notation

  import_types(RentajWeb.Scalars.Decimal)

  input_object :filter_items do
    field :active, :boolean
  end

  object :item do
    field :id, non_null(:id)
    field :user_id, non_null(:id)
    field :name, non_null(:string)
    field :price_per_day, non_null(:decimal)
    field :capara, :decimal
    field :delivery, non_null(:boolean)
    field :pick_up, non_null(:boolean)
    field :description, :string
    field :updated_at, :string
    field :inserted_at, :string

    field :user, non_null(:user) do
      resolve(&AccountResolver.preload_user/3)
    end

    field :location, non_null(:location) do
      resolve(&LocationResolver.preload_location/3)
    end

    field :availability_seven_days, list_of(:item_availability) do
      resolve(&ItemResolver.get_item_availability_7_days/3)
    end
  end

  input_object :create_item_input do
    field :name, non_null(:string)
    field :category_id, non_null(:string)
    field :description, :string
    field :price_per_day, non_null(:decimal)
    field :capara, non_null(:decimal)
    field :delivery, non_null(:boolean)
    field :pick_up, non_null(:boolean)
    field :location_id, non_null(:string)
  end

  input_object :item_by_id_input do
    field :item_id, non_null(:id)
  end

  object :item_availability do
    field :date, non_null(:string)
    field :available, non_null(:boolean)
  end
end
