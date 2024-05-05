defmodule RentajWeb.Types.Items do
  use Absinthe.Schema.Notation

  object :item do
    field :name, non_null(:string)
  end

  input_object :create_item_input do
    field :name, non_null(:string)
    field(:category_id, non_null(:string))
  end
end
