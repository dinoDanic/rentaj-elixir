defmodule RentajWeb.Resolvers.OrderResolver do
  alias Rentaj.Accounts
  alias Rentaj.Orders

  def get_user_orders(_, _, %{context: %{current_user: current_user}}) do
    case Accounts.list_orders(current_user.id) do
      {:ok, orders} -> {:ok, orders}
    end
  end

  def create_order(_, %{input: input}, %{context: %{current_user: current_user}}) do
    input_with_customer_id = Map.put(input, :customer_id, current_user.id)

    case Orders.create_order(input_with_customer_id) do
      {:ok, order} ->
        {:ok, order}

      {:error, err} ->
        IO.inspect(err)
        {:error, "Could not create item"}
    end
  end
end
