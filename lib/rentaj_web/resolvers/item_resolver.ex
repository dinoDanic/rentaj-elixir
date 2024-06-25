defmodule RentajWeb.Resolvers.ItemResolver do
  alias Rentaj.Items
  import Ecto.Query
  alias Rentaj.Repo

  def create_item(_, %{input: args}, %{context: %{current_user: current_user}}) do
    input_with_user_id = Map.put(args, :user_id, current_user.id)

    case Items.create_item(input_with_user_id) do
      {:ok, item} ->
        {:ok, item}

      {:error, err} ->
        IO.inspect(err)
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
      |> Enum.sort_by(& &1.updated_at, &>=/2)

    case items do
      nil -> {:ok, nil}
      _ -> {:ok, items}
    end
  end

  def get_item(_, %{input: %{item_id: item_id}}, _) do
    try do
      item = Items.get_item!(item_id)
      {:ok, item}
    rescue
      Ecto.NoResultsError ->
        IO.puts("No item found")
        {:error, "could not find item"}

      exception ->
        IO.inspect(exception, label: "Unexpected error")
        {:error, "something went wrong"}
    end
  end
end
