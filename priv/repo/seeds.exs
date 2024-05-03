# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Rentaj.Repo.insert!(%Rentaj.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Rentaj.News.Link
alias Rentaj.Users.User
alias Rentaj.Repo

%Link{url: "http://graphql.org/", description: "The Best Query Language"} |> Repo.insert!()
%Link{url: "http://dev.apollodata.com/", description: "Awesome GraphQL Client"} |> Repo.insert!()

%User{
  first_name: "test",
  last_name: "test",
  password: "test",
  username: "test",
  email: "test@test.com"
}
|> Repo.insert!()
