defmodule Rentaj.Items.Item do
  use Ecto.Schema
  import Ecto.Changeset

  schema "items" do
    field :name, :string
    field :price_per_day, :decimal
    field :delivery, :boolean
    field :pick_up, :boolean
    field :capara, :decimal
    field :description, :string
    field :active, :boolean

    belongs_to :category, Rentaj.Categories.Category
    belongs_to :user, Rentaj.Accounts.User

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(item, attrs) do
    item
    |> cast(attrs, [
      :name,
      :category_id,
      :user_id,
      :price_per_day,
      :delivery,
      :pick_up,
      :capara,
      :description,
      :active
    ])
    |> validate_required([:name, :category_id, :user_id, :price_per_day, :active])
  end
end
