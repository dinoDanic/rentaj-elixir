defmodule RentajWeb.Scalars.Decimal do
  use Absinthe.Schema.Notation

  scalar :decimal, name: "Decimal" do
    description("A custom scalar for Decimal values")

    parse(fn
      %{value: value}, _ ->
        case Decimal.parse(value) do
          {decimal, ""} -> {:ok, decimal}
          :error -> :error
        end

      # Handle the case where the field is not sent from the client
      %Absinthe.Blueprint.Input.Null{}, _ ->
        {:ok, Decimal.new(0)}

      _, _ ->
        :error
    end)

    serialize(&Decimal.to_string/1)
  end
end
