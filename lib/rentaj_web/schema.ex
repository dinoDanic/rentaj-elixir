defmodule RentajWeb.Schema do
  use Absinthe.Schema

  alias RentajWeb.Resolvers.SearchResolver
  alias RentajWeb.Resolvers.ItemResolver
  alias RentajWeb.Resolvers.CategoryResolver
  alias RentajWeb.Resolvers.AccountResolver

  import_types(RentajWeb.Types.Accounts)
  import_types(RentajWeb.Types.Categories)
  import_types(RentajWeb.Types.Items)
  import_types(RentajWeb.Types.Search)

  @unauthorized_queries [
    :create_session,
    :create_user,
    :categories,
    :search_categories,
    :search_items
  ]

  query do
    @desc "Get me"
    field :me, :me do
      resolve(&AccountResolver.get_me/3)
    end

    @desc "Get Categories"
    field :categories, list_of(:category) do
      resolve(&CategoryResolver.get_categories/3)
    end

    @desc "search items"
    field :search_items, list_of(:item) do
      arg(:input, :search_input)
      resolve(&SearchResolver.search_items/3)
    end

    @desc "search categories"
    field :search_categories, list_of(:category) do
      arg(:input, :search_input)
      resolve(&SearchResolver.search_categories/3)
    end
  end

  mutation do
    @desc "Create a new user"
    field :create_user, :user do
      arg(:input, :create_user_input)
      resolve(&AccountResolver.create_user/3)
    end

    @desc "Create a session"
    field :create_session, :session do
      arg(:input, :create_session_input)
      resolve(&AccountResolver.create_session/3)
    end

    @desc "Create a item"
    field :create_item, :item do
      arg(:input, :create_item_input)
      resolve(&ItemResolver.create_item/3)
    end
  end

  def middleware(middleware, %{identifier: identifier}, _object)
      when identifier in @unauthorized_queries do
    middleware
  end

  def middleware(middleware, _field, %Absinthe.Type.Object{identifier: identifier})
      when identifier in [:query, :subscription, :mutation] do
    [RentajWeb.Middleare | middleware]
  end

  def middleware(middleware, _field, _object) do
    middleware
  end
end
