defmodule RentajWeb.Types.Categories do
  alias RentajWeb.Resolvers.CategoryResolver
  use Absinthe.Schema.Notation

  object :category do
    field :name, non_null(:string)
    field :id, non_null(:id)
    field :image_url, :string

    field :child_categories, list_of(:category) do
      resolve(&CategoryResolver.preload_child_categories/3)
    end

    field :parent_category, :category do
      resolve(&CategoryResolver.preload_parent_cateogry/3)
    end
  end
end
