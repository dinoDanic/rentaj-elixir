alias Rentaj.Orders.Order
alias Rentaj.Repo
alias Rentaj.Factory

# {:ok, start_date1, 0} = DateTime.from_iso8601("2024-05-13T22:10:42Z")
# {:ok, end_date1, 0} = DateTime.from_iso8601("2024-05-15T22:10:44Z")
#
# {:ok, start_date2, 0} = DateTime.from_iso8601("2024-05-17T22:10:42Z")
# {:ok, end_date2, 0} = DateTime.from_iso8601("2024-05-23T22:10:44Z")
#
#
# %Order{item_id: 1, renter_id: 1, customer_id: 2, start_date: start_date1, end_date: end_date1, delivery: true, pick_up: false, status: :draft} |> Repo.insert!()
# %Order{item_id: 2, renter_id: 2, customer_id: 2, start_date: start_date1, end_date: end_date1, delivery: true, pick_up: false, status: :draft} |> Repo.insert!()
# %Order{item_id: 3, renter_id: 3, customer_id: 3, start_date: start_date2, end_date: end_date2, delivery: true, pick_up: false, status: :draft} |> Repo.insert!()
# %Order{item_id: 4, renter_id: 1, customer_id: 2, start_date: start_date2, end_date: end_date2, delivery: true, pick_up: false, status: :draft} |> Repo.insert!()
# %Order{item_id: 5, renter_id: 1, customer_id: 5, start_date: start_date2, end_date: end_date2, delivery: true, pick_up: false, status: :draft} |> Repo.insert!()
# %Order{item_id: 6, renter_id: 1, customer_id: 4, start_date: start_date2, end_date: end_date2, delivery: true, pick_up: false, status: :draft} |> Repo.insert!()


1..20000
|> Enum.each(fn _ ->
  Factory.insert(:order)
end)
