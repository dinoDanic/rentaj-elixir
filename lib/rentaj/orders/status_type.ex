defmodule Rentaj.Orders.StatusType do
  use Ecto.Type

  @statuses [:draft, :waiting_for_renter, :declined, :completed]

  def type, do: :string

  def cast(value) when is_binary(value) do
    case String.to_atom(value) do
      value when value in @statuses -> {:ok, value}
      _ -> :error
    end
  end

  def cast(value) when value in @statuses, do: {:ok, value}
  def cast(_), do: :error

  def load(value) when is_binary(value), do: {:ok, String.to_atom(value)}
  def load(value) when value in @statuses, do: {:ok, value}

  def dump(value) when value in @statuses, do: {:ok, Atom.to_string(value)}
  def dump(_), do: :error
end
