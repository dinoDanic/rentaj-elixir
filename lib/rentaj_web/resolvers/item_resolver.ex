defmodule RentajWeb.Resolvers.ItemResolver do
  alias Rentaj.Items

  def create_item(_, %{input: args}, %{context: %{current_user: current_user}}) do
    input_with_user_id = Map.put(args, :user_id, current_user.id)

    case Items.create_item(input_with_user_id) do
      {:ok, item} ->
        {:ok, item}

      _ ->
        {:error, "error could not create items"}
    end
  end

  def get_items(_, _, _) do
    case Items.list_items() do
      [] -> {:error, "no items"}
      items -> {:ok, items}
    end
  end
end
