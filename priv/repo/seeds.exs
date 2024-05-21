# seed_files = [
#   "priv/repo/seeds/seed_users.ex",
#   "priv/repo/seeds/seed_categories.ex",
#   "priv/repo/seeds/seed_items.ex",
#   "priv/repo/seeds/seed_orders.ex"
# ]
#
# Enum.each(seed_files, fn seed_file ->
#   IO.puts("Running seed file: #{seed_file}")
#   Code.eval_file(seed_file)
# end)

alias Rentaj.Repo
alias Rentaj.Factory

alias Rentaj.Accounts.User
alias Rentaj.Items.Item
alias Rentaj.Orders.Order

%User{
  email: "user@user.com",
  password:
    "$argon2id$v=19$m=65536,t=3,p=4$d9+Cxm0nLSg73bZEnzou6A$cuyIpRRISWLevX75hRDoE/eWrlp6XACaopZV77th5L4"
}
|> Repo.insert!()

1..20000
|> Enum.each(fn _ ->
  Factory.insert(:user)
end)

Code.eval_file("priv/repo/seeds/seed_categories.ex")

1..20000
|> Enum.each(fn _ ->
  Factory.insert(:item)
end)

1..20000
|> Enum.each(fn _ ->
  Factory.insert(:order)
end)
