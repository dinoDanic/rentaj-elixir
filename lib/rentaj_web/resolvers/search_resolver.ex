defmodule RentajWeb.Resolvers.SearchResolver do
  alias Rentaj.Items

  def search_items(_, %{input: %{query: query}}, _) do
    case Items.search_item(query) do
      [] -> {:error, "no results"}
      items -> {:ok, items}
    end
  end
end
