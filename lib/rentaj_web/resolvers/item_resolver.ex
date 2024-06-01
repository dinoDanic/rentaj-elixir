defmodule RentajWeb.Resolvers.ItemResolver do
  alias Rentaj.Items
  import Ecto.Query
  alias Rentaj.Repo

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

  def preload_items(parent, args, _) do
    # preload_query = from i in Items.Item, where: i.active == ^active
    base_query = from(i in Items.Item)

    query =
      case args do
        %{input: %{active: active}} ->
          from i in Items.Item, where: i.active == ^active

        _ ->
          base_query
      end

    items =
      parent
      |> Repo.preload(items: query)
      |> Map.get(:items)

    case items do
      nil -> {:ok, nil}
      _ -> {:ok, items}
    end
  end
end
