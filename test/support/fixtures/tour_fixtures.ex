defmodule Passport.TourFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Passport.Tour` context.
  """

  @doc """
  Generate a specialty_bar.
  """
  def specialty_bar_fixture(attrs \\ %{}) do
    {:ok, specialty_bar} =
      attrs
      |> Enum.into(%{
        name: "some name",
        address: "some address",
        description: "some description",
        instagram: "some instagram",
        tiktok: "some tiktok",
        facebook: "some facebook"
      })
      |> Passport.Tour.create_specialty_bar()

    specialty_bar
  end

  @doc """
  Generate a checkin.
  """
  def checkin_fixture(attrs \\ %{}) do
    {:ok, checkin} =
      attrs
      |> Enum.into(%{

      })
      |> Passport.Tour.create_checkin()

    checkin
  end
end
