defmodule BookwormWeb.Router do
  use BookwormWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", BookwormWeb do
    pipe_through :api

    get "/health", HealthCheckController, :index
    resources "/rest/books", BookController, only: [:index, :show]
  end

  forward "/graphql", Absinthe.Plug, schema: BookwormWeb.Schema
end
