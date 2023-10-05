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
      |> Enum.into(%{})
      |> Passport.Tour.create_checkin()

    checkin
  end

  @doc """
  Generate a physical_document.
  """
  def physical_document_fixture(attrs \\ %{}) do
    {:ok, physical_document} =
      attrs
      |> Enum.into(%{
        identifier: "999999",
        img_url: "https://s3.amazonaws.com/bucket/file.jpg"
      })
      |> Passport.Tour.create_physical_document()

    physical_document
  end
end
