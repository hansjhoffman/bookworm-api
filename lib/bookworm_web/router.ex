defmodule BookwormWeb.Router do
  use BookwormWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/rest", BookwormWeb do
    pipe_through :api

    resources "/books", BookController, only: [:index, :show]
  end
end
