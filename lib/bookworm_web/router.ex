defmodule BookwormWeb.Router do
  use BookwormWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/rest", BookwormWeb do
    pipe_through :api

    resources "/books", BookController, only: [:index, :show]
  end

  forward "/graphql", Absinthe.Plug, schema: BookwormWeb.Schema

  # scope "/" do
  #   pipe_through :api
  #
  #   forward "/graphql", Absinthe.Plug, schema: BookwormWeb.Schema
  # end
end
