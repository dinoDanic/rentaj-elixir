alias Rentaj.Accounts.User
alias Rentaj.Repo
alias Rentaj.Factory

if Repo.aggregate(User, :count, :id) == 0 do
  %User{ email: "user@user.com", company_id: 1, password: "$argon2id$v=19$m=65536,t=3,p=4$d9+Cxm0nLSg73bZEnzou6A$cuyIpRRISWLevX75hRDoE/eWrlp6XACaopZV77th5L4" } |> Repo.insert!()

  1..20000
  |> Enum.each(fn _ ->
    Factory.insert(:user)
  end)
end
