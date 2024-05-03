defmodule RentajWeb.Schema do
  use Absinthe.Schema

  alias RentajWeb.Resolvers.NewsResolver
  alias RentajWeb.Resolvers.AccountResolver

  object :link do
    field :id, non_null(:id)
    field :url, non_null(:string)
    field :description, non_null(:string)
  end

  object :user do
    field :id, non_null(:id)
    field :email, non_null(:string)
  end

  object :session do
    field :token, non_null(:string)
    field :user, non_null(:user)
  end

  query do
    @desc "Get all links"
    field :all_links, non_null(list_of(non_null(:link))) do
      resolve(&NewsResolver.all_links/3)
    end

    @desc "Get me"
    field :me, :user do
      middleware(RentajWeb.Middleare)
      resolve(&AccountResolver.get_me/3)
    end
  end

  mutation do
    @desc "Create a new link"
    field :create_link, :link do
      # middleware(RentajWeb.Middleare)
      arg(:url, non_null(:string))
      arg(:description, non_null(:string))

      resolve(&NewsResolver.create_link/3)
    end

    @desc "Create a new user"
    field :create_user, :user do
      arg(:email, non_null(:string))
      arg(:password, non_null(:string))
      arg(:token, non_null(:string))

      resolve(&AccountResolver.create_user/3)
    end

    @desc "Create a session"
    field :create_session, :session do
      arg(:email, non_null(:string))
      arg(:password, non_null(:string))

      resolve(&AccountResolver.create_session/3)
    end
  end

  # def middleware(middleware, _field, %Absinthe.Type.Object{identifier: identifier})
  #     when identifier in [:query, :subscription, :mutation] do
  #   [RentajWeb.Middleare | middleware]
  # end
  #
  # def middleware(middleware, _field, _object) do
  #   middleware
  # end
end
