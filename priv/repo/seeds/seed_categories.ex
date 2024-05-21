alias Rentaj.Categories.Category
alias Rentaj.Repo

%Category{name: "Electronics", category_id: nil} |> Repo.insert!()
%Category{name: "Smartphones", category_id: 1} |> Repo.insert!()
%Category{name: "Laptops", category_id: 1} |> Repo.insert!()
%Category{name: "Cameras", category_id: 1} |> Repo.insert!()

%Category{name: "Clothing", category_id: nil} |> Repo.insert!()
%Category{name: "Men's Clothing", category_id: 2} |> Repo.insert!()
%Category{name: "Women's Clothing", category_id: 2} |> Repo.insert!()
%Category{name: "Kids' Clothing", category_id: 2} |> Repo.insert!()

%Category{name: "Furniture", category_id: nil} |> Repo.insert!()
%Category{name: "Living Room Furniture", category_id: 3} |> Repo.insert!()
%Category{name: "Bedroom Furniture", category_id: 3} |> Repo.insert!()
%Category{name: "Kitchen Furniture", category_id: 3} |> Repo.insert!()
