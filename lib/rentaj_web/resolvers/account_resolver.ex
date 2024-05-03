defmodule RentajWeb.Resolvers.AccountResolver do
  alias Rentaj.Accounts

  def create_user(_root, args, _info) do
    case Accounts.create_user(args) do
      {:ok, user} -> {:ok, user}
      _error -> {:error, "could not create user"}
    end
  end

  def create_session(_root, %{password: password, email: email}, _info) do
    IO.inspect(email)
    IO.inspect(password)

    case Accounts.authenticate_user(email, password) do
      {:ok, user} ->
        case Rentaj.Guardian.encode_and_sign(user) do
          {:ok, token, _full_claims} ->
            {:ok, %{token: token, user: user}}

          _ ->
            {:error, "Failed to generate token"}
        end

      _error ->
        {:error, "Ivalid email or passwrod"}
    end
  end

  def get_me(_, _, %{context: %{current_user: current_user}}) do
    {:ok, current_user}
  end
end