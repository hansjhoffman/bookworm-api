defmodule Bookworm.Books.Book do
  use Ecto.Schema
  import Ecto.Changeset

  schema "books" do
    field :authors, :string
    field :description, :string
    field :rating, :integer
    field :thumbnail, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:title, :description, :thumbnail, :rating, :authors])
    |> validate_required([:title, :description, :thumbnail, :rating, :authors])
    |> unique_constraint(:title)
  end
end
