defmodule RentajWeb.Types.Search do
  use Absinthe.Schema.Notation

  input_object :search_input do
    field :query, :string
  end
end
