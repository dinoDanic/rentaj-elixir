alias Rentaj.Repo
alias Rentaj.Items.Item
alias Rentaj.Factory

if Repo.aggregate(Item, :count, :id) == 0 do
  1..20000
  |> Enum.each(fn _ ->
    Factory.insert(:item)
  end)
end
