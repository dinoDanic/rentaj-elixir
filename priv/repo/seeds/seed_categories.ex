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
