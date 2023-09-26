defmodule Passport.Repo.Migrations.CreateCheckins do
  use Ecto.Migration

  def change do
    create table(:checkins, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :specialty_bar_id, references(:specialty_bars, on_delete: :nothing, type: :binary_id)
      add :user_id, references(:users, on_delete: :nothing, type: :binary_id)

      timestamps()
    end

    create index(:checkins, [:specialty_bar_id])
    create index(:checkins, [:user_id])
  end
end
