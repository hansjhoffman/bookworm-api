defmodule BookwormWeb.HealthCheckControllerTest do
  use BookwormWeb.ConnCase

  test "GET /health", %{conn: conn} do
    conn = get(conn, "/health")

    assert json_response(conn, 200) == %{
             "status" => "pass",
             "version" => to_string(Application.spec(:bookworm, :vsn))
           }
  end
end
