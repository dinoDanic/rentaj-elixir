alias Rentaj.Repo
alias Rentaj.Items.Item
alias Rentaj.Factory

1..20000
|> Enum.each(fn _ ->
  Factory.insert(:item)
end)
