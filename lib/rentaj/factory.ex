defmodule Rentaj.Factory do
  use ExMachina.Ecto, repo: Rentaj.Repo

  alias Faker.Company
  alias Rentaj.Accounts.User
  alias Rentaj.Items.Item
  alias Rentaj.Locations.Location
  alias Rentaj.Companies.Company
  alias Rentaj.Orders.Order

  def company_factory do
    %Company{
      name: Faker.Company.name(),
      oib: Faker.UUID.v4(),
      location_id: Enum.random(1..20000)
    }
  end

  def user_factory do
    %User{
      email: Faker.Internet.email(),
      password:
        "$argon2id$v=19$m=65536,t=3,p=4$d9+Cxm0nLSg73bZEnzou6A$cuyIpRRISWLevX75hRDoE/eWrlp6XACaopZV77th5L4",
      company_id: maybe_assign_company_id()
    }
  end

  def location_factory do
    %Location{
      address: Faker.Address.street_address(),
      city: Faker.Address.city(),
      postal_code: Faker.Address.zip_code(),
      lat: generate_latitude() |> Float.to_string(),
      long: generate_longitude() |> Float.to_string()
    }
  end

  def item_factory do
    %Item{
      name: Faker.Commerce.product_name(),
      category_id: Enum.random(1..60),
      user_id: Enum.random(1..1000),
      location_id: Enum.random(1..20000),
      description: Faker.Lorem.paragraph() |> String.slice(0, 255),
      price_per_day: Faker.Commerce.price(),
      pick_up: Enum.random([true, false]),
      delivery: Enum.random([true, false]),
      capara: if(Enum.random([true, false]), do: Faker.Commerce.price(), else: nil),
      active: Enum.random([true, false])
    }
  end

  def order_factory do
    %Order{
      item_id: Enum.random(1..20000),
      renter_id: Enum.random(1..20),
      customer_id: Enum.random(1..20),
      start_date: Faker.DateTime.backward(4),
      end_date: Faker.DateTime.forward(4),
      delivery: Enum.random([true, false]),
      pick_up: Enum.random([true, false]),
      status: Enum.random([:draft, :waiting_for_renter, :declined, :completed])
    }
  end

  defp maybe_assign_company_id do
    if :rand.uniform() <= 0.2 do
      get_unique_company_id()
    else
      nil
    end
  end

  defp get_unique_company_id do
    # Generate a unique list of IDs
    ids = 1..20000 |> Enum.to_list() |> Enum.shuffle()
    # Use a Stream to ensure uniqueness
    Stream.cycle(ids) |> Enum.take(1) |> hd()
  end

  defp generate_latitude do
    # Latitude range between Zagreb and Sveti Ivan Zelina
    min_lat = 45.8
    max_lat = 45.95
    :rand.uniform() * (max_lat - min_lat) + min_lat
  end

  defp generate_longitude do
    # Longitude range between Zagreb and Sveti Ivan Zelina
    min_long = 15.9
    max_long = 16.3
    :rand.uniform() * (max_long - min_long) + min_long
  end
end
