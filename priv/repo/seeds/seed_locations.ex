alias Rentaj.Repo
alias Rentaj.Locations.Location
alias Rentaj.Factory

1..20000
|> Enum.each(fn _ ->
  Factory.insert(:location)
end)
