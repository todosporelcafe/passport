defmodule Passport.Repo.Migrations.CreatePhysicalDocuments do
  use Ecto.Migration

  def change do
    create table(:physical_documents, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :identifier, :string, unique: true
      add :img_url, :string
      add :user_id, references(:users, on_delete: :nothing, type: :binary_id), null: false
      timestamps()
    end

    create index(:physical_documents, [:user_id])
  end
end
