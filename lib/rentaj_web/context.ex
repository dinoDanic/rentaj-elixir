defmodule RentajWeb.Context do
  @behaviour Plug

  import Plug.Conn
  import Ecto.Query, only: [where: 2]

  alias RentajWeb.Services.Token.Token
  alias RentajWeb.Services.Token.Signer
  alias Rentaj.Repo
  alias Rentaj.Users.User

  def init(opts), do: opts

  def call(conn, _) do
    context = build_context(conn)
    Absinthe.Plug.put_options(conn, context: context)
  end

  @doc """
  Return the current user context based on the authorization header
  """
  def build_context(conn) do
    with ["Bearer " <> token] <- get_req_header(conn, "authorization"),
         {:ok, %{"account_id" => account_id}} <-
           Token.verify_and_validate(token, Signer.generate()),
         {:ok, current_user} <- authorize(account_id) do
      %{current_user: current_user}
    else
      _ ->
        %{current_user: nil}
    end
  end

  defp authorize(account_id) do
    User
    |> where(id: ^account_id)
    |> Repo.one()
    |> case do
      nil -> {:error, "invalid authorization token"}
      user -> {:ok, user}
    end
  end
end
