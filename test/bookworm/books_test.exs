defmodule Bookworm.BooksTest do
  use Bookworm.DataCase

  alias Bookworm.Books

  describe "books" do
    alias Bookworm.Books.Book

    @valid_attrs %{
      authors: "some authors",
      description: "some description",
      rating: 42,
      thumbnail: "some thumbnail",
      title: "some title"
    }
    @update_attrs %{
      authors: "some updated authors",
      description: "some updated description",
      rating: 43,
      thumbnail: "some updated thumbnail",
      title: "some updated title"
    }
    @invalid_attrs %{authors: nil, description: nil, rating: nil, thumbnail: nil, title: nil}

    def book_fixture(attrs \\ %{}) do
      {:ok, book} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Books.create_book()

      book
    end

    test "list_books/0 returns all books" do
      book = book_fixture()
      assert Books.list_books() == [book]
    end

    test "get_book!/1 returns the book with given id" do
      book = book_fixture()
      assert Books.get_book!(book.id) == book
    end

    test "create_book/1 with valid data creates a book" do
      assert {:ok, %Book{} = book} = Books.create_book(@valid_attrs)
      assert book.authors == "some authors"
      assert book.description == "some description"
      assert book.rating == 42
      assert book.thumbnail == "some thumbnail"
      assert book.title == "some title"
    end

    test "create_book/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Books.create_book(@invalid_attrs)
    end

    test "update_book/2 with valid data updates the book" do
      book = book_fixture()
      assert {:ok, %Book{} = book} = Books.update_book(book, @update_attrs)
      assert book.authors == "some updated authors"
      assert book.description == "some updated description"
      assert book.rating == 43
      assert book.thumbnail == "some updated thumbnail"
      assert book.title == "some updated title"
    end

    test "update_book/2 with invalid data returns error changeset" do
      book = book_fixture()
      assert {:error, %Ecto.Changeset{}} = Books.update_book(book, @invalid_attrs)
      assert book == Books.get_book!(book.id)
    end

    test "delete_book/1 deletes the book" do
      book = book_fixture()
      assert {:ok, %Book{}} = Books.delete_book(book)
      assert_raise Ecto.NoResultsError, fn -> Books.get_book!(book.id) end
    end

    test "change_book/1 returns a book changeset" do
      book = book_fixture()
      assert %Ecto.Changeset{} = Books.change_book(book)
    end
  end
end
