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
# alias Rentaj.News.Link
# alias Rentaj.Repo
#
# %Link{url: "http://graphql.org/", description: "The Best Query Language"} |> Repo.insert!
# %Link{url: "http://dev.apollodata.com/", description: "Awesome GraphQL Client"} |> Repo.insert!

alias Rentaj.Categories.Category
alias Rentaj.Repo

%Category{name: "category 1", category_id: nil} |> Repo.insert!()
%Category{name: "category 1-1", category_id: 1} |> Repo.insert!()
%Category{name: "category 1-2", category_id: 1} |> Repo.insert!()
%Category{name: "category 1-3", category_id: 1} |> Repo.insert!()


%Category{name: "category 2", category_id: nil} |> Repo.insert!()
%Category{name: "category 2-1", category_id: 2} |> Repo.insert!()
%Category{name: "category 2-2", category_id: 2} |> Repo.insert!()
%Category{name: "category 2-3", category_id: 2} |> Repo.insert!()

%Category{name: "category 3", category_id: nil} |> Repo.insert!()
%Category{name: "category 3-1", category_id: 3} |> Repo.insert!()
%Category{name: "category 3-2", category_id: 3} |> Repo.insert!()
%Category{name: "category 3-3", category_id: 3} |> Repo.insert!()
