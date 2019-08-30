defmodule BookwormWeb.Schema.Query.BookDetailTest do
  use BookwormWeb.ConnCase, async: true

  describe "book field" do
    test "returns info about the book with the given id" do
      conn = build_conn()

      conn =
        get conn, "/graphql",
          query: """
          {
            book(id: 1) {
              id
              title
            }
          }
          """

      expected = %{
        "data" => %{
          "book" => %{"id" => "1", "title" => "Atlas Shrugged"}
        }
      }

      assert json_response(conn, 200) == expected
    end

    test "returns an error -> can't find book" do
      conn = build_conn()

      conn =
        get conn, "/graphql",
          query: """
          {
            book(id: 100) {
              id
              title
            }
          }
          """

      expected = %{
        "data" => %{
          "book" => nil
        },
        "errors" => [
          %{
            "locations" => [
              %{
                "column" => 0,
                "line" => 2
              }
            ],
            "message" => "Book with ID 100 not found",
            "path" => [
              "book"
            ]
          }
        ]
      }

      assert json_response(conn, 200) == expected
    end
  end
end
