defmodule Graphql.Mutations.CreateSession do
  alias RentajWeb.Services.Authorization.Account

  def resolve(_root, %{input: input}, _context) do
    Account.execute(input[:email], input[:username], input[:password])
  end
end
