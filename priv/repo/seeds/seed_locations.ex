alias Rentaj.Repo
alias Rentaj.Locations.Location
alias Rentaj.Factory

if Repo.aggregate(Location, :count, :id) == 0 do
  1..20000
  |> Enum.each(fn _ ->
    Factory.insert(:location)
  end)
end

