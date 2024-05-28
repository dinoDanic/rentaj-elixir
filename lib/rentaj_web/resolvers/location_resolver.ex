defmodule RentajWeb.Resolvers.LocationResolver do
  def preload_location(parent, _args, _info) do
    preload =
      parent
      |> Rentaj.Repo.preload(:location)
      |> Map.get(:location)

    case preload do
      nil -> {:ok, nil}
      location -> {:ok, location}
    end
  end
end
