defmodule RentajWeb.Types.Items do
  use Absinthe.Schema.Notation

  import_types(RentajWeb.Scalars.Decimal)

  object :item do
    field :name, non_null(:string)
    field :price_per_day, non_null(:decimal)
    field :delivery, non_null(:boolean)
    field :pick_up, non_null(:boolean)
    field :description, :string
  end

  input_object :create_item_input do
    field :name, non_null(:string)
    field(:category_id, non_null(:string))
  end
end
