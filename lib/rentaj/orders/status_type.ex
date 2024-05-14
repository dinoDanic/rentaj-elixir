defmodule Rentaj.Orders.StatusType do
  use Ecto.Type

  @statuses [:draft, :waiting_for_renter, :declined, :completed]

  def type, do: :string

  def cast(value) do
    if value in @statuses do
      {:ok, value}
    else
      :error
    end
  end

  def load(value), do: {:ok, value}

  def dump(value), do: {:ok, value}
end
