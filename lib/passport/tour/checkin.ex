defmodule Passport.Tour.Checkin do
  use Ecto.Schema
  import Ecto.Changeset
  alias Passport.Accounts.User
  alias Passport.Tour.SpecialtyBar

  @fields ~w/specialty_bar_id user_id/a

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "checkins" do
    belongs_to :user, User
    belongs_to :specialty_bar, SpecialtyBar

    timestamps()
  end

  @doc false
  def changeset(checkin, attrs) do
    checkin
    |> cast(attrs, @fields)
    |> validate_required(@fields)
    |> assoc_constraint(:specialty_bar)
    |> assoc_constraint(:user)
  end
end
