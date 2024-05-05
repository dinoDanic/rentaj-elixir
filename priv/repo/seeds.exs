alias Rentaj.Categories.Category
alias Rentaj.Accounts.User
alias Rentaj.Repo
alias Rentaj.Items.Item

%User{ email: "user1@user.com", password: "$argon2id$v=19$m=65536,t=3,p=4$d9+Cxm0nLSg73bZEnzou6A$cuyIpRRISWLevX75hRDoE/eWrlp6XACaopZV77th5L4" } |> Repo.insert!()
%User{ email: "user2@user.com", password: "$argon2id$v=19$m=65536,t=3,p=4$d9+Cxm0nLSg73bZEnzou6A$cuyIpRRISWLevX75hRDoE/eWrlp6XACaopZV77th5L4" } |> Repo.insert!()
%User{ email: "user3@user.com", password: "$argon2id$v=19$m=65536,t=3,p=4$d9+Cxm0nLSg73bZEnzou6A$cuyIpRRISWLevX75hRDoE/eWrlp6XACaopZV77th5L4" } |> Repo.insert!()
%User{ email: "user4@user.com", password: "$argon2id$v=19$m=65536,t=3,p=4$d9+Cxm0nLSg73bZEnzou6A$cuyIpRRISWLevX75hRDoE/eWrlp6XACaopZV77th5L4" } |> Repo.insert!()
%User{ email: "user5@user.com", password: "$argon2id$v=19$m=65536,t=3,p=4$d9+Cxm0nLSg73bZEnzou6A$cuyIpRRISWLevX75hRDoE/eWrlp6XACaopZV77th5L4" } |> Repo.insert!()
%User{ email: "user6@user.com", password: "$argon2id$v=19$m=65536,t=3,p=4$d9+Cxm0nLSg73bZEnzou6A$cuyIpRRISWLevX75hRDoE/eWrlp6XACaopZV77th5L4" } |> Repo.insert!()


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


%Item{name: "Item 1", category_id: 1, user_id: 1} |> Repo.insert!()
%Item{name: "Item 2", category_id: 2, user_id: 1} |> Repo.insert!()
%Item{name: "Item 3", category_id: 3, user_id: 1} |> Repo.insert!()
%Item{name: "Item 4", category_id: 3, user_id: 1} |> Repo.insert!()
%Item{name: "Item 5", category_id: 3, user_id: 2} |> Repo.insert!()
%Item{name: "Item 5", category_id: 4, user_id: 2} |> Repo.insert!()
%Item{name: "Item 6", category_id: 4, user_id: 3} |> Repo.insert!()
%Item{name: "Item 7", category_id: 4, user_id: 3} |> Repo.insert!()
%Item{name: "Item 8", category_id: 6, user_id: 3} |> Repo.insert!()
%Item{name: "Item 9", category_id: 8, user_id: 4} |> Repo.insert!()
%Item{name: "Item 10", category_id: 9, user_id: 5} |> Repo.insert!()
%Item{name: "Item 11", category_id: 9, user_id: 6} |> Repo.insert!()
%Item{name: "Item 12", category_id: 9, user_id: 6} |> Repo.insert!()
%Item{name: "Item 13", category_id: 11, user_id: 6} |> Repo.insert!()
%Item{name: "Item 14", category_id: 12, user_id: 6} |> Repo.insert!()

# Define a list of seed files to be executed in order
# seed_files = [
#   "priv/repo/seeds/seed_products.ex",
#   "priv/repo/seeds/seed_categories.ex",
#   "priv/repo/seeds/seed_products_categories.ex",
#   "priv/repo/seeds/seed_products_recommendations.ex",
#   "priv/repo/seeds/seed_accounts.ex",
#   "priv/repo/seeds/seed_featured_products.ex",
#   "priv/repo/seeds/seed_products_instructions_download_urls.ex",
#   "priv/repo/seeds/seed_update_products_info.ex"
# ]
#
# # Iterate over the seed files and run each one
# Enum.each(seed_files, fn seed_file ->
#   IO.puts("Running seed file: #{seed_file}")
#   Code.eval_file(seed_file)
# end)
