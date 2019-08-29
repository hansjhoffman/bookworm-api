defmodule BookwormWeb.BookView do
  use BookwormWeb, :view
  alias BookwormWeb.BookView

  def render("index.json", %{books: books}) do
    %{data: render_many(books, BookView, "book.json")}
  end

  def render("show.json", %{book: book}) do
    %{data: render_one(book, BookView, "book.json")}
  end

  def render("book.json", %{book: book}) do
    %{
      id: book.id,
      title: book.title,
      description: book.description,
      thumbnail: book.thumbnail,
      rating: book.rating,
      authors: book.authors
    }
  end
end
