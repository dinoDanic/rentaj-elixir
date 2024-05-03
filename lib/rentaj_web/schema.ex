defmodule RentajWeb.Schema do
  use Absinthe.Schema

  use RentajWeb.Auth.Middleware

  alias RentajWeb.Resolvers.NewsResolver
  alias Graphql.Mutations.CreateSession

  object :link do
    field :id, non_null(:id)
    field :url, non_null(:string)
    field :description, non_null(:string)
  end

  object :user do
    field :id, :id
    field :name, :string
    field :email, :string
  end

  object :session do
    field(:token, :string)
  end

  input_object :create_session_input do
    field(:email, :string)
    field(:username, :string)
    field(:password, non_null(:string))
  end

  query do
    @desc "Get all links"
    field :all_links, non_null(list_of(non_null(:link))) do
      resolve(&NewsResolver.all_links/3)
    end

    field :me, :user do
      resolve(fn _, _, %{context: %{current_user: current_user}} ->
        {:ok, current_user}
      end)
    end
  end

  mutation do
    @desc "Create a new link"
    field :create_link, :link do
      arg(:url, non_null(:string))
      arg(:description, non_null(:string))

      resolve(&NewsResolver.create_link/3)
    end

    field :create_session, :session do
      arg(:input, :create_session_input)
      resolve(&CreateSession.resolve/3)
    end
  end
end
