alias Rentaj.Categories.Category
alias Rentaj.Repo


if Repo.aggregate(Category, :count, :id) == 0 do
  %Category{name: "Elektronika", category_id: nil, image_url: nil } |> Repo.insert!()
  %Category{name: "Pametni telefoni", category_id: 1, image_url: nil } |> Repo.insert!()
  %Category{name: "Prijenosna računala", category_id: 1, image_url: nil } |> Repo.insert!()
  %Category{name: "Kamere", category_id: 1, image_url: nil } |> Repo.insert!()

  %Category{name: "Odjeća", category_id: nil, image_url: nil } |> Repo.insert!()
  %Category{name: "Muška odjeća", category_id: 2, image_url: nil } |> Repo.insert!()
  %Category{name: "Ženska odjeća", category_id: 2, image_url: nil } |> Repo.insert!()
  %Category{name: "Dječja odjeća", category_id: 2, image_url: nil } |> Repo.insert!()

  %Category{name: "Namještaj", category_id: nil, image_url: nil } |> Repo.insert!()
  %Category{name: "Namještaj za dnevni boravak", category_id: 3, image_url: nil } |> Repo.insert!()
  %Category{name: "Namještaj za spavaću sobu", category_id: 3, image_url: nil } |> Repo.insert!()
  %Category{name: "Namještaj za kuhinju", category_id: 3, image_url: nil } |> Repo.insert!()

  %Category{name: "Knjige", category_id: nil, image_url: nil } |> Repo.insert!()
  %Category{name: "Fikcija", category_id: 4, image_url: nil } |> Repo.insert!()
  %Category{name: "Nefikcija", category_id: 4, image_url: nil } |> Repo.insert!()
  %Category{name: "Dječje knjige", category_id: 4, image_url: nil } |> Repo.insert!()

  %Category{name: "Sport", category_id: nil, image_url: nil } |> Repo.insert!()
  %Category{name: "Sportska oprema", category_id: 5, image_url: nil } |> Repo.insert!()
  %Category{name: "Sportska odjeća", category_id: 5, image_url: nil } |> Repo.insert!()
  %Category{name: "Sportska obuća", category_id: 5, image_url: nil } |> Repo.insert!()

  %Category{name: "Kućanski aparati", category_id: nil, image_url: nil } |> Repo.insert!()
  %Category{name: "Hladnjaci", category_id: 6, image_url: nil } |> Repo.insert!()
  %Category{name: "Perilice posuđa", category_id: 6, image_url: nil } |> Repo.insert!()
  %Category{name: "Mikrovalne pećnice", category_id: 6, image_url: nil } |> Repo.insert!()

  %Category{name: "Kozmetika", category_id: nil, image_url: nil } |> Repo.insert!()
  %Category{name: "Njega lica", category_id: 7, image_url: nil } |> Repo.insert!()
  %Category{name: "Njega tijela", category_id: 7, image_url: nil } |> Repo.insert!()
  %Category{name: "Šminka", category_id: 7, image_url: nil } |> Repo.insert!()

  %Category{name: "Igračke", category_id: nil, image_url: nil } |> Repo.insert!()
  %Category{name: "Lego kocke", category_id: 8, image_url: nil } |> Repo.insert!()
  %Category{name: "Lutke", category_id: 8, image_url: nil } |> Repo.insert!()
  %Category{name: "Društvene igre", category_id: 8, image_url: nil } |> Repo.insert!()

  %Category{name: "Automobili", category_id: nil, image_url: nil } |> Repo.insert!()
  %Category{name: "Dijelovi automobila", category_id: 9, image_url: nil } |> Repo.insert!()
  %Category{name: "Gume", category_id: 9, image_url: nil } |> Repo.insert!()
  %Category{name: "Auto oprema", category_id: 9, image_url: nil } |> Repo.insert!()

  %Category{name: "Glazbeni instrumenti", category_id: nil, image_url: nil } |> Repo.insert!()
  %Category{name: "Gitare", category_id: 10, image_url: nil } |> Repo.insert!()
  %Category{name: "Klaviri", category_id: 10, image_url: nil } |> Repo.insert!()
  %Category{name: "Bubnjevi", category_id: 10, image_url: nil } |> Repo.insert!()

  %Category{name: "Vrt i okućnica", category_id: nil, image_url: nil } |> Repo.insert!()
  %Category{name: "Vrtni alati", category_id: 11, image_url: nil } |> Repo.insert!()
  %Category{name: "Vrtni namještaj", category_id: 11, image_url: nil } |> Repo.insert!()
  %Category{name: "Roštilji", category_id: 11, image_url: nil } |> Repo.insert!()

  %Category{name: "Hrana i piće", category_id: nil, image_url: nil } |> Repo.insert!()
  %Category{name: "Slastice", category_id: 12, image_url: nil } |> Repo.insert!()
  %Category{name: "Pića", category_id: 12, image_url: nil } |> Repo.insert!()
  %Category{name: "Grickalice", category_id: 12, image_url: nil } |> Repo.insert!()

  %Category{name: "Računalna oprema", category_id: nil, image_url: nil } |> Repo.insert!()
  %Category{name: "Miševi", category_id: 13, image_url: nil } |> Repo.insert!()
  %Category{name: "Tipkovnice", category_id: 13, image_url: nil } |> Repo.insert!()
  %Category{name: "Monitori", category_id: 13, image_url: nil } |> Repo.insert!()

  %Category{name: "Kuhinja i blagovaonica", category_id: nil, image_url: nil } |> Repo.insert!()
  %Category{name: "Posuđe", category_id: 14, image_url: nil } |> Repo.insert!()
  %Category{name: "Pribor za jelo", category_id: 14, image_url: nil } |> Repo.insert!()
  %Category{name: "Stolnjaci", category_id: 14, image_url: nil } |> Repo.insert!()

  %Category{name: "Kućni ljubimci", category_id: nil, image_url: nil } |> Repo.insert!()
  %Category{name: "Hrana za kućne ljubimce", category_id: 15, image_url: nil } |> Repo.insert!()
  %Category{name: "Oprema za kućne ljubimce", category_id: 15, image_url: nil } |> Repo.insert!()
  %Category{name: "Igračke za kućne ljubimce", category_id: 15, image_url: nil } |> Repo.insert!()

end
