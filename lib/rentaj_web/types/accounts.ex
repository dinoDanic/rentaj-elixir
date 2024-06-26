defmodule RentajWeb.Types.Accounts do
  use Absinthe.Schema.Notation

  alias RentajWeb.Resolvers.ItemResolver
  alias RentajWeb.Resolvers.CompanyResolver
  alias RentajWeb.Resolvers.AccountResolver
  alias RentajWeb.Resolvers.OrderResolver

  object :me do
    field :account, :user do
      resolve(&AccountResolver.get_me/3)
    end

    field :orders, list_of(:order) do
      resolve(&OrderResolver.get_user_orders/3)
    end

    field :company, :company do
      resolve(&CompanyResolver.preload_company/3)
    end

    field :items, list_of(:item) do
      arg(:input, :filter_items)
      resolve(&ItemResolver.preload_items/3)
    end
  end

  object :user do
    field :id, non_null(:id)
    field :email, non_null(:string)
    field :contact_number, non_null(:string)

    field :company, :company do
      resolve(&CompanyResolver.preload_company/3)
    end
  end

  object :session do
    field :token, non_null(:string)
    field :user, non_null(:user)
  end

  input_object :create_session_input do
    field :email, non_null(:string)
    field(:password, non_null(:string))
  end

  input_object :create_user_input do
    field :email, non_null(:string)
    field(:password, non_null(:string))
  end
end
