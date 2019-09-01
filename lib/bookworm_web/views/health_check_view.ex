defmodule BookwormWeb.HealthCheckView do
  use BookwormWeb, :view

  def render("index.json", %{response: response}) do
    %{status: response.status, version: response.version}
  end
end
