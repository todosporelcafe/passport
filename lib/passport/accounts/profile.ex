defmodule Passport.Accounts.Profile do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "profiles" do
    field :name, :string
    field :phone_number, :string
    field :zip_code, :string
    field :born_date, :date
    field :last_name, :string

    belongs_to :user, Passport.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(profile, attrs) do
    profile
    |> common_validations(attrs)
  end

  @doc false
  def profile_registration_changeset(user, attrs) do
    user
    |> Ecto.build_assoc(:profile)
    |> common_validations(attrs)
  end

  defp common_validations(profile, attrs) do
    profile
    |> cast(attrs, [:phone_number, :zip_code, :born_date, :name, :last_name])
    |> validate_required([:phone_number, :zip_code, :born_date, :name, :last_name])
    |> validate_format(:zip_code, ~r/^\d{5}$/)
    |> validate_format(:phone_number, ~r/^\d{10}$/)
    |> foreign_key_constraint(:user_id)
  end
end
