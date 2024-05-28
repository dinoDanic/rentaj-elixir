alias Rentaj.Orders.Order
alias Rentaj.Repo
alias Rentaj.Factory

if Repo.aggregate(Order, :count, :id) == 0 do
  1..20000
  |> Enum.each(fn _ ->
    Factory.insert(:order)
  end)
end
