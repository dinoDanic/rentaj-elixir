defmodule RentajWeb.Router do
  use RentajWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: RentajWeb.Schema,
      interface: :simple,
      context: %{pubsub: RentajWeb.Endpoint}
  end
end
