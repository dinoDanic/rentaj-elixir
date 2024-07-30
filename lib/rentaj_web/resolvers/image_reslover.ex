defmodule RentajWeb.Resolvers.ImageResolver do
  alias Rentaj.Images

  def add_image(_, %{input: args}, _) do
    case Images.create_image(args) do
      {:ok, image} ->
        {:ok, image}

      {:error, err} ->
        IO.inspect(err)
        {:error, "error could add image"}
    end
  end

  def preload_images(parent, _args, _info) do
    preload =
      parent
      |> Rentaj.Repo.preload(:images)
      |> Map.get(:images)

    case preload do
      nil -> {:ok, nil}
      result -> {:ok, result}
    end
  end
end
