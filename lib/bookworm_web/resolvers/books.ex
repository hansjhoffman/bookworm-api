defmodule BookwormWeb.Resolvers.Books do
  @moduledoc """
  Provides resolver functions for book queries
  """

  alias Bookworm.Books

  def list_books(_parent, _args, _resolution) do
    {:ok, Books.list_books()}
  end

  def book(_parent, %{id: id}, _resolution) do
    case Books.book(id) do
      {:ok, book} -> {:ok, book}
      {:error, _} -> {:error, "Book with ID #{id} not found"}
    end
  end
end
