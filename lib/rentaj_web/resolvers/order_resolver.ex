defmodule RentajWeb.Resolvers.OrderResolver do
  alias Rentaj.Accounts

  def get_user_orders(_, _, %{context: %{current_user: current_user}}) do
    case Accounts.list_orders(current_user.id) do
      {:ok, orders} -> {:ok, orders}
    end
  end
end
