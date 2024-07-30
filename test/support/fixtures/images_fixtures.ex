defmodule Rentaj.ImagesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Rentaj.Images` context.
  """

  @doc """
  Generate a image.
  """
  def image_fixture(attrs \\ %{}) do
    {:ok, image} =
      attrs
      |> Enum.into(%{

      })
      |> Rentaj.Images.create_image()

    image
  end
end
