# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Bookworm.Repo.insert!(%Bookworm.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
alias Bookworm.Books

books = [
  %{
    title: "Atlas Shrugged",
    authors: "Ayn Rand",
    description: "Peopled by larger-than-life heroes and villains...",
    thumbnail:
      "https://images-na.ssl-images-amazon.com/images/I/51ADlvbdzOL._SX332_BO1,204,203,200_.jpg",
    rating: 3
  }
]

Enum.each(books, fn book ->
  Books.create_book(book)
end)
