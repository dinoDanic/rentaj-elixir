defmodule RentajWeb.Schema do
  use Absinthe.Schema
  use Absinthe.Relay.Schema, :modern

  alias RentajWeb.Resolvers.SearchResolver
  alias RentajWeb.Resolvers.ItemResolver
  alias RentajWeb.Resolvers.CategoryResolver
  alias RentajWeb.Resolvers.AccountResolver
  alias RentajWeb.Resolvers.OrderResolver

  import_types(RentajWeb.Types.Accounts)
  import_types(RentajWeb.Types.Categories)
  import_types(RentajWeb.Types.Items)
  import_types(RentajWeb.Types.Search)
  import_types(RentajWeb.Types.Orders)

  connection(node_type: :item)

  @unauthorized_queries [
    :create_session,
    :create_user,
    :categories,
    :parent_categories,
    :search_categories,
    :search_items,
    :testing
  ]

  query do
    connection field :search_items, node_type: :item do
      arg(:input, :search_input)
      resolve(&SearchResolver.search_items/3)
    end

    @desc "Get me"
    field :me, :me do
      resolve(&AccountResolver.get_me/3)
    end

    @desc "Get Categories"
    field :categories, list_of(:category) do
      resolve(&CategoryResolver.get_categories/3)
    end

    @desc "Get Parent Categories"
    field :parent_categories, list_of(:category) do
      resolve(&CategoryResolver.get_parent_categories/3)
    end

    @desc "search items"
    field :search_items_bk, list_of(:item) do
      arg(:input, :search_input)
      resolve(&SearchResolver.search_items_bk/3)
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

    @desc "Create a order"
    field :create_order, :order do
      arg(:input, :create_order_input)
      resolve(&OrderResolver.create_order/3)
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
