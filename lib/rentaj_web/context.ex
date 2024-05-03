defmodule RentajWeb.Context do
  @behaviour Plug

  import Plug.Conn

  alias Rentaj.Accounts

  def init(opts), do: opts

  def call(conn, _) do
    context = build_context(conn)
    Absinthe.Plug.put_options(conn, context: context)
  end

  @doc """
  Return the current user context based on the authorization header
  """
  def build_context(conn) do
    IO.puts(~c"tu samjmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmmm ")
    tk = get_req_header(conn, "authorization")
    IO.inspect(tk)

    with ["Bearer " <> token] <- get_req_header(conn, "authorization"),
         {:ok, claims} <- Rentaj.Guardian.decode_and_verify(token),
         {:ok, current_user} <- resource_from_claims(claims) do
      %{current_user: current_user}
    else
      _ -> %{}
    end
  end

  defp resource_from_claims(%{"sub" => id}) do
    user = Accounts.get_user!(id)

    case user do
      nil -> {:error, "User not found"}
      _ -> {:ok, user}
    end
  end
end
