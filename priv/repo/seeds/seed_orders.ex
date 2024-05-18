alias Rentaj.Orders.Order
alias Rentaj.Repo

%Order{item_id: 1, renter_id: 1, customer_id: 2, start_date: "2024-05-13 22:10:42", end_date: "2024-05-15 22:10:44", delivery: true, pick_up: false, status: :draft} |> Repo.insert!()
