defmodule RentajWeb.Resolvers.AccountResolver do
  alias Rentaj.Accounts

  def create_user(_root, %{input: args}, _info) do
    case Accounts.create_user(args) do
      {:ok, user} ->
        {:ok, user}

      _error ->
        {:error, "could not create user"}
    end
  end

  def create_session(_root, %{input: %{password: password, email: email}}, _info) do
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

  def preload_user(parent, _args, _info) do
    preload =
      parent
      |> Rentaj.Repo.preload(:user)
      |> Map.get(:user)

    case preload do
      nil -> {:ok, nil}
      user -> {:ok, user}
    end
  end
end
