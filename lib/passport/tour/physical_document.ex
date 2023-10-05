defmodule Passport.Tour.PhysicalDocument do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key {:id, :binary_id, autogenerate: true}
  @foreign_key_type :binary_id
  schema "physical_documents" do
    field :identifier, :string
    field :img_url, :string

    belongs_to :user, Passport.Accounts.User

    timestamps()
  end

  def physical_document_registration_changeset(user, attrs) do
    user
    |> Ecto.build_assoc(:physical_documents)
    |> changeset(attrs)
  end

  @doc false
  def changeset(physical_document, attrs) do
    physical_document
    |> cast(attrs, [:identifier, :img_url])
    |> validate_required([:identifier, :img_url])
    |> validate_format(:identifier, ~r/^\d{6}$/)
    |> assoc_constraint(:user)
  end
end
