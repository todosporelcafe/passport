defmodule Passport.Repo.Migrations.CreateSpecialtyBars do
  use Ecto.Migration

  def change do
    create table(:specialty_bars, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :address, :string
      add :instagram, :string
      add :tiktok, :string
      add :facebook, :string
      add :description, :string

      timestamps()
    end
  end
end
