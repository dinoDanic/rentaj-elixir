defmodule RentajWeb.Auth.Middleware do
  defmacro __using__(_) do
    quote do
      # alias KodiStragaWeb.API.Graphql.Middleware
      alias RentajWeb.Auth.RequireAuth

      def middleware(middleware, field, object) do
        IO.puts("FFFFFFFFFFFFFFFFIELLDDDDDDDDDDDDDDDDDDDD")
        IO.inspect(field)

        authorized_fields = [
          :edit_product,
          :id
        ]

        if field.__reference__.module === Absinthe.Type.BuiltIns.Introspection do
          middleware
        else
          if Enum.member?(authorized_fields, field.identifier) do
            [RequireAuth | middleware]
          else
            middleware
          end
        end
      end
    end
  end
end
