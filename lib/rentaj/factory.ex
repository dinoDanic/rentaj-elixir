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
      user_id: Enum.random(1..20000),
      description: Faker.Lorem.paragraph() |> String.slice(0, 255),
      price_per_day: Faker.Commerce.price(),
      pick_up: Enum.random([true, false]),
      delivery: Enum.random([true, false]),
      capara: if(Enum.random([true, false]), do: Faker.Commerce.price(), else: nil),
      active: true
    }
  end

  # def random_datetime_between(start_date, end_date) do
  #   {start_date_ms, _} = DateTime.to_erl(start_date)
  #   {end_date_ms, _} = DateTime.to_erl(end_date)
  #
  #   random_ms = Enum.random(start_date_ms..end_date_ms)
  #   DateTime.from_unix!(div(random_ms, 1000))
  # end

  def order_factory do
    # start_date = Faker.Date.backward(365)
    # end_date = Faker.Date.forward(365)

    %Order{
      item_id: Enum.random(1..20000),
      renter_id: Enum.random(1..20000),
      customer_id: 2,
      start_date: Faker.DateTime.backward(4),
      end_date: Faker.DateTime.forward(4),
      delivery: Enum.random([true, false]),
      pick_up: Enum.random([true, false]),
      status: Enum.random([:draft, :waiting_for_renter, :declined, :completed])
    }
  end
end
