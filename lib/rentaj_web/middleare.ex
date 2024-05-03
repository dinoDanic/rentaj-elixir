defmodule RentajWeb.Middleare do
  @behaviour Absinthe.Middleware

  def call(resolution, _config) do
    IO.puts("2. MIDLEWARE")
    IO.inspect(resolution.context)
    IO.puts("2. MIDLEWARE END")

    case resolution.context do
      %{current_user: _} ->
        resolution

      _ ->
        resolution
        |> Absinthe.Resolution.put_result({:error, "unauthenticated"})
    end
  end
end
