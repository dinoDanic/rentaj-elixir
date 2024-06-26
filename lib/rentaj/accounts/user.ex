defmodule Rentaj.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Argon2

  schema "users" do
    field :email, :string
    field :password, :string
    field :contact_number, :string

    has_many :items, Rentaj.Items.Item
    has_many :orders, Rentaj.Orders.Order, foreign_key: :customer_id
    has_many :rented_items, Rentaj.Orders.Order, foreign_key: :renter_id
    belongs_to :company, Rentaj.Companies.Company

    timestamps(type: :utc_datetime)
  end

  @email_regex ~r/^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,12}$/

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :password, :contact_number])
    |> validate_required([:email, :password, :contact_number])
    |> validate_format(:email, @email_regex, message: "invalid_email_format")
    |> unique_constraint(:email)
    |> put_password_hash()
  end

  defp put_password_hash(
         %Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset
       ) do
    change(changeset, password: Argon2.hash_pwd_salt(password))
  end

  defp put_password_hash(changeset), do: changeset
end
