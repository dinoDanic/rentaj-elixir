alias Rentaj.Accounts.User
alias Rentaj.Repo
alias Rentaj.Factory


1..20000
|> Enum.each(fn _ ->
  Factory.insert(:company)
end)
