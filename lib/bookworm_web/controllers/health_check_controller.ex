defmodule BookwormWeb.HealthCheckController do
  use BookwormWeb, :controller

  def index(conn, _params) do
    response = %{
      status: "pass",
      version: to_string(Application.spec(:bookworm, :vsn))
    }

    render(conn, "index.json", response: response)
  end
end
