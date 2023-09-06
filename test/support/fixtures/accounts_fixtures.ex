defmodule Passport.AccountsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Passport.Accounts` context.
  """

  def unique_user_email, do: "user#{System.unique_integer()}@example.com"
  def valid_user_password, do: "hello world!"

  def valid_user_attributes(attrs \\ %{}) do
    Enum.into(attrs, %{
      email: unique_user_email(),
      password: valid_user_password()
    })
  end

  def user_fixture(attrs \\ %{}) do
    {:ok, user} =
      attrs
      |> valid_user_attributes()
      |> Passport.Accounts.register_user()

    user
  end

  def extract_user_token(fun) do
    {:ok, captured_email} = fun.(&"[TOKEN]#{&1}[TOKEN]")
    [_, token | _] = String.split(captured_email.text_body, "[TOKEN]")
    token
  end

  @doc """
  Generate a profile.
  """
  def profile_fixture(user, attrs \\ %{}) do
    attrs =
      attrs
      |> Enum.into(%{
        name: "some name",
        phone_number: "1234567890",
        zip_code: "00000",
        born_date: ~D[2023-09-01],
        last_name: "some last_name"
      })

    {:ok, profile} =
      user
      |> Passport.Accounts.create_profile(attrs)

    profile
  end
end
