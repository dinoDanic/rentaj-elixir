defmodule RentajWeb.Resolvers.SearchResolver do
  alias Rentaj.Items
  alias Rentaj.Items.Item
  alias Rentaj.Repo
  alias Rentaj.Categories
  import Ecto.Query

  alias Absinthe.Relay.Connection

  def search_items(_, args, _) do
    base_query = from(i in Item)

    query =
      case args do
        %{input: %{query: query}} ->
          from i in base_query,
            where: ilike(i.name, ^"%#{query}%")

        _ ->
          base_query
      end

    Connection.from_query(query, &Repo.all/1, args)
  end

  def search_items_bk(_, %{input: %{query: query}}, _) do
    case Items.search_items(query) do
      [] -> {:ok, []}
      items -> {:ok, items}
    end
  end

  def search_categories(_, %{input: %{query: query}}, _) do
    case Categories.search_categories(query) do
      [] -> {:ok, []}
      items -> {:ok, items}
    end
  end
end
