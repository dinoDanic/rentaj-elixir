defmodule RentajWeb.Resolvers.CompanyResolver do
  def preload_company(parent, _args, _info) do
    preload =
      parent
      |> Rentaj.Repo.preload(:company)
      |> Map.get(:company)

    case preload do
      nil -> {:ok, nil}
      company -> {:ok, company}
    end
  end
end
