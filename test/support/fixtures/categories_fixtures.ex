defmodule Rentaj.CategoriesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Rentaj.Categories` context.
  """

  @doc """
  Generate a category.
  """
  def category_fixture(attrs \\ %{}) do
    {:ok, category} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> Rentaj.Categories.create_category()

    category
  end
end
