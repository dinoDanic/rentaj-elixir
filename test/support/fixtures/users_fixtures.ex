defmodule Rentaj.UsersFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Rentaj.Users` context.
  """

  @doc """
  Generate a user.
  """
  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> Enum.into(%{
        email: "some email",
        password_hash: "some password_hash",
        token: "some token"
      })
      |> Rentaj.Users.create_user()

    user
  end
end
