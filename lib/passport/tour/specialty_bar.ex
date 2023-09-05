defmodule Passport.Tour.SpecialtyBar do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "specialty_bars" do
    field :name, :string
    field :address, :string
    field :description, :string
    field :instagram, :string
    field :tiktok, :string
    field :facebook, :string

    timestamps()
  end

  @doc false
  def changeset(specialty_bar, attrs) do
    specialty_bar
    |> cast(attrs, [:name, :address, :instagram, :tiktok, :facebook, :description])
    |> validate_required([:name, :address, :instagram, :tiktok, :facebook, :description])
  end
end
