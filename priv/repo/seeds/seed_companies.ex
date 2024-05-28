alias Rentaj.Repo
alias Rentaj.Factory
alias Rentaj.Companies.Company

if Repo.aggregate(Company, :count, :id) == 0 do
  1..20000
  |> Enum.each(fn _ ->
    Factory.insert(:company)
  end)
end
