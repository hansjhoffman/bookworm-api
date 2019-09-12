defmodule Bookworm.Books.Book do
  use Ecto.Schema
  import Ecto.Changeset

  schema "books" do
    field :authors, :string
    field :description, :string
    field :rating, :integer, default: 0
    field :thumbnail, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(book, attrs) do
    book
    |> cast(attrs, [:authors, :description, :rating, :thumbnail, :title])
    |> validate_required([:title, :description, :thumbnail, :rating, :authors])
    |> validate_required([:authors, :title])
    |> unique_constraint(:title)
  end
end
