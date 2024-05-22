defmodule Rentaj.Factory do
  use ExMachina.Ecto, repo: Rentaj.Repo

  alias Rentaj.Accounts.User
  alias Rentaj.Items.Item
  alias Rentaj.Orders.Order

  def user_factory do
    %User{
      email: Faker.Internet.email(),
      password:
        "$argon2id$v=19$m=65536,t=3,p=4$d9+Cxm0nLSg73bZEnzou6A$cuyIpRRISWLevX75hRDoE/eWrlp6XACaopZV77th5L4"
    }
  end

  def item_factory do
    %Item{
      name: Faker.Commerce.product_name(),
      category_id: Enum.random(1..12),
      user_id: Enum.random(1..20),
      description: Faker.Lorem.paragraph() |> String.slice(0, 255),
      price_per_day: Faker.Commerce.price(),
      pick_up: Enum.random([true, false]),
      delivery: Enum.random([true, false]),
      capara: if(Enum.random([true, false]), do: Faker.Commerce.price(), else: nil),
      active: true
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
end
