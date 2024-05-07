defmodule RentajWeb.Resolvers.SearchResolver do
  alias Rentaj.Items
  alias Rentaj.Categories

  def search_items(_, %{input: %{query: query}}, _) do
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
