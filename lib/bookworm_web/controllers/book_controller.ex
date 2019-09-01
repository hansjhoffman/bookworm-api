defmodule BookwormWeb.BookController do
  use BookwormWeb, :controller

  alias Bookworm.Books

  action_fallback BookwormWeb.FallbackController

  def index(conn, _params) do
    books = Books.list_books()

    render(conn, "index.json", books: books)
  end

  def show(conn, %{"id" => id}) do
    book = Books.get_book!(id)

    render(conn, "show.json", book: book)
  end
end
