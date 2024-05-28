defmodule Rentaj.LocationsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Rentaj.Locations` context.
  """

  @doc """
  Generate a location.
  """
  def location_fixture(attrs \\ %{}) do
    {:ok, location} =
      attrs
      |> Enum.into(%{

      })
      |> Rentaj.Locations.create_location()

    location
  end
end
