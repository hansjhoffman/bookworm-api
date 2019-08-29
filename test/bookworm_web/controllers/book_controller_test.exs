defmodule BookwormWeb.BookControllerTest do
  use BookwormWeb.ConnCase

  describe "index" do
    test "lists all books", %{conn: conn} do
      conn = get(conn, Routes.book_path(conn, :index))

      assert json_response(conn, 200)["data"] == [
               %{
                 "id" => 1,
                 "authors" => "Ayn Rand",
                 "description" => "Peopled by larger-than-life heroes and villains...",
                 "rating" => 3,
                 "title" => "Atlas Shrugged",
                 "thumbnail" =>
                   "https://images-na.ssl-images-amazon.com/images/I/51ADlvbdzOL._SX332_BO1,204,203,200_.jpg"
               }
             ]
    end
  end

  describe "show" do
    test "details for a book", %{conn: conn} do
      conn = get(conn, Routes.book_path(conn, :show, 1))

      assert %{
               "id" => 1,
               "authors" => "Ayn Rand",
               "description" => "Peopled by larger-than-life heroes and villains...",
               "title" => "Atlas Shrugged"
             } = json_response(conn, 200)["data"]
    end
  end
end
