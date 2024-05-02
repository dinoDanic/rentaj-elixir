defmodule Rentaj.Repo do
  use Ecto.Repo,
    otp_app: :rentaj,
    adapter: Ecto.Adapters.Postgres
end
