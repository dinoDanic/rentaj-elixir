defmodule RentajWeb.Types.Categories do
  alias RentajWeb.Resolvers.CategoryResolver
  use Absinthe.Schema.Notation

  input_object :category_input do
    field :id, :id
  end

  object :category do
    field :name, non_null(:string)
    field :id, non_null(:id)
    field :image_url, :string

    field :items, list_of(:item) do
      resolve(&CategoryResolver.preload_items/3)
    end

    field :items_count, :integer do
      resolve(&CategoryResolver.items_count/3)
    end

    field :child_categories, list_of(:category) do
      resolve(&CategoryResolver.preload_child_categories/3)
    end

    field :parent_category, :category do
      resolve(&CategoryResolver.preload_parent_cateogry/3)
    end
  end
end
