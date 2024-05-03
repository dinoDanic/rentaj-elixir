defmodule RentajWeb.Types.Accounts do
  use Absinthe.Schema.Notation

  object :user do
    field :id, non_null(:id)
    field :email, non_null(:string)
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
