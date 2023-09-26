defmodule Passport.Tour.Checkin do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "checkins" do

    field :specialty_bar_id, :binary_id
    field :user_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(checkin, attrs) do
    checkin
    |> cast(attrs, [])
    |> validate_required([])
  end
end
