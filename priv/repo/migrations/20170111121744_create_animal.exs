defmodule GraphqlTest.Repo.Migrations.CreateAnimal do
  use Ecto.Migration

  def change do
    create table(:animals) do
      add :name, :string
      add :info, :string
      add :birth_date, :timestamptz

      timestamps()
    end

  end
end
