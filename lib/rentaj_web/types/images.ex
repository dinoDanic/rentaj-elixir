defmodule RentajWeb.Types.Images do
  use Absinthe.Schema.Notation

  object :image do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :image_url, non_null(:string)
  end

  input_object :add_image_to_item_input do
    field :item_id, non_null(:id)
    field :name, non_null(:string)
    field :image_url, non_null(:string)
  end
end
