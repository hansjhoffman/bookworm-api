defmodule BookwormWeb.Schema do
  @moduledoc """
  GraphQL schema for bookworm apps
  """

  use Absinthe.Schema

  alias BookwormWeb.Resolvers

  object :book do
    @desc "Simple auto-increment database id"
    field :id, non_null(:id)
    @desc "Combined authors of the book"
    field :authors, non_null(:string)
    @desc "A short summary of the book"
    field :description, :string
    @desc "The uri for a thumbnail"
    field :thumbnail, :string
    @desc "A random number between 1 and 5"
    field :rating, :integer
    @desc "The title of the book"
    field :title, non_null(:string)
  end

  query do
    @desc "List all books"
    field :books, list_of(:book) do
      resolve(&Resolvers.Books.list_books/3)
    end

    @desc "Get info about a book"
    field :book, :book do
      arg(:id, non_null(:id))
      resolve(&Resolvers.Books.book/3)
    end
  end
end
