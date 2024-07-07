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

  def update_item(_, %{input: args, id: id}, %{context: %{current_user: current_user}}) do
    item = Items.get_item!(id)

    if current_user.id != item.user_id do
      {:error, "You are not the owner of this item."}
    else
      case Items.update_item(item, args) do
        {:ok, updated_item} -> {:ok, updated_item}
        {:error, changeset} -> {:error, changeset}
      end
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

  @doc """
  Gets the availability of an item for the next 7 days.

  The availability is determined based on the item's orders. An item is
  considered available on a given date if:
  - There is no order for that date.

  """
  def get_item_availability_7_days(item, _, _) do
    item = Repo.preload(item, :orders)
    today = Date.utc_today()

    next_7_days = Enum.map(0..6, &Date.add(today, &1))

    availability =
      Enum.map(next_7_days, fn date ->
        available = is_available?(item.orders, date)
        %{date: date |> Date.to_string(), available: available}
      end)

    {:ok, availability}
  end

  defp is_available?(orders, date) do
    case Enum.find(orders, fn order -> order_date_matches?(order, date) end) do
      nil -> true
      _ -> false
    end
  end

  defp order_date_matches?(order, date) do
    Date.compare(order.start_date, date) != :gt and Date.compare(order.end_date, date) != :lt
  end
end
