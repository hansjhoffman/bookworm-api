defmodule Bookworm.Repo.Migrations.CreateBooks do
  use Ecto.Migration

  def change do
    create table(:books) do
      add :title, :string
      add :description, :text
      add :thumbnail, :string
      add :rating, :integer
      add :authors, :string

      timestamps()
    end

    create unique_index(:books, [:title])
  end
end
