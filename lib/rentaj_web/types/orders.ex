defmodule RentajWeb.Types.Orders do
  use Absinthe.Schema.Notation

  enum :order_status do
    value(:draft)
    value(:waiting_for_renter)
    value(:declined)
    value(:completed)
  end

  object :order do
    field :id, non_null(:id)
    field :start_date, non_null(:string)
    field :end_date, non_null(:string)
    field :delivery, non_null(:boolean)
    field :pick_up, non_null(:boolean)
    field :status, non_null(:order_status)
  end
end
