alias Rentaj.Categories.Category
alias Rentaj.Accounts.User
alias Rentaj.Repo

%User{email: "user2@user.com", password: "$argon2id$v=19$m=65536,t=3,p=4$hG6QCCsqJrdfZzLKZ29JRA$XaFIuTrNFBW+odX8ttYHj+JRTk5qNuiUCuIzZWY/woY"} |> Repo.insert!()

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
