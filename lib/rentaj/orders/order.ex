defmodule Rentaj.Orders.Order do
  use Ecto.Schema
  import Ecto.Changeset

  schema "orders" do
    field :start_date, :utc_datetime
    field :end_date, :utc_datetime
    field :delivery, :boolean
    field :pick_up, :boolean
    field :status, Rentaj.Orders.StatusType

    belongs_to :item, Rentaj.Items.Item
    belongs_to :renter, Rentaj.Accounts.User, foreign_key: :renter_id
    belongs_to :customer, Rentaj.Accounts.User, foreign_key: :customer_id

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(order, attrs) do
    order
    |> cast(attrs, [
      :start_date,
      :end_date,
      :delivery,
      :pick_up,
      :renter_id,
      :customer_id,
      :status
    ])
    |> validate_required([
      :start_date,
      :end_date,
      :delivery,
      :pick_up,
      :renter_id,
      :counter_id,
      :status
    ])
    |> validate_dates
    |> validate_inclusion(:status, ["draft", "waiting_for_renter", "declined", "completed"])
  end

  defp validate_dates(changeset) do
    start_date = get_field(changeset, :start_date)
    end_date = get_field(changeset, :end_date)

    if start_date && end_date && start_date > end_date do
      add_error(changeset, :end_date, "must be after start date")
    else
      changeset
    end
  end
end
