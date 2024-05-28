defmodule Rentaj.CompaniesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Rentaj.Companies` context.
  """

  @doc """
  Generate a company.
  """
  def company_fixture(attrs \\ %{}) do
    {:ok, company} =
      attrs
      |> Enum.into(%{

      })
      |> Rentaj.Companies.create_company()

    company
  end
end
