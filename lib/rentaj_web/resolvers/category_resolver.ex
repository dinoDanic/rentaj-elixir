defmodule RentajWeb.Resolvers.CategoryResolver do
  alias Rentaj.Categories
  alias Rentaj.Repo
  import Ecto.Query

  def get_categories(_root, _args, _info) do
    case Categories.list_categories() do
      [] -> {:error, "no categories"}
      categories -> {:ok, categories}
    end
  end

  def preload_child_categories(parent, _args, _info) do
    preload =
      parent
      |> Repo.preload(:categories)
      |> Map.get(:categories)

    case preload do
      [] -> {:ok, nil}
      categories -> {:ok, categories}
    end
  end

  def preload_parent_cateogry(parent, _args, _info) do
    preload =
      parent
      |> Repo.preload(:category)
      |> Map.get(:category)

    case preload do
      nil -> {:ok, nil}
      category -> {:ok, category}
    end
  end

  def preload_items(parent, _args, _info) do
    preload =
      parent
      |> Repo.preload(:items)
      |> Map.get(:items)

    case preload do
      nil -> {:ok, nil}
      items -> {:ok, items}
    end
  end

  def items_count(parent, _args, _info) do
    count =
      from(i in Rentaj.Items.Item, where: i.category_id == ^parent.id, select: count(i.id))
      |> Repo.one()

    {:ok, count}
  end

  def get_parent_categories(_root, _args, _info) do
    case Categories.list_parent_categories() do
      [] -> {:error, "no categories"}
      categories -> {:ok, categories}
    end
  end
end
