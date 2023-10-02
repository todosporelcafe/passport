defmodule Passport.Tour.PhysicalDocument do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "physical_documents" do
    field :identifier, :string
    field :user_id, :binary_id

    timestamps()
  end

  @doc false
  def changeset(physical_document, attrs) do
    physical_document
    |> cast(attrs, [:identifier])
    |> validate_required([:identifier])
  end
end
