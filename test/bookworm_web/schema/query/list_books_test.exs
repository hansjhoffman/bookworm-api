defmodule BookwormWeb.Schema.Query.ListBooksTest do
  use BookwormWeb.ConnCase, async: true

  @query """
  {
    books {
      id
      authors
      title
    }
  }
  """

  test "listBooks field returns a list of books" do
    conn = build_conn()
    conn = get conn, "/graphql", query: @query

    expected = %{
      "data" => %{
        "books" => [
          %{"id" => "1", "authors" => "Ayn Rand", "title" => "Atlas Shrugged"}
        ]
      }
    }

    assert json_response(conn, 200) == expected
  end
end
