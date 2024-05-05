defmodule RentajWeb.Schema do
  use Absinthe.Schema

  alias RentajWeb.Resolvers.ItemResolver
  alias RentajWeb.Resolvers.CategoryResolver
  alias RentajWeb.Resolvers.AccountResolver

  import_types(RentajWeb.Types.Accounts)
  import_types(RentajWeb.Types.Categories)
  import_types(RentajWeb.Types.Items)

  @unauthorized_queries [:create_session, :create_user, :categories]

  query do
    @desc "Get me"
    field :me, :user do
      resolve(&AccountResolver.get_me/3)
    end

    @desc "Get Categories"
    field :categories, list_of(:category) do
      resolve(&CategoryResolver.get_categories/3)
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
