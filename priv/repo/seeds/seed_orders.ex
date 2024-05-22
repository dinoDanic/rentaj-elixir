alias Rentaj.Orders.Order
alias Rentaj.Repo
alias Rentaj.Factory

1..20000
|> Enum.each(fn _ ->
  Factory.insert(:order)
end)
