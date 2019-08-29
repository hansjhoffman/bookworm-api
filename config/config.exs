# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :bookworm,
  ecto_repos: [Bookworm.Repo]

# Configures the endpoint
config :bookworm, BookwormWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "kZJLgUE69jAj4M1xwYKsdhaDXiaAuy7lN6GZcCBwJ8QDTA/YqSnr83Be6M/zowai",
  render_errors: [view: BookwormWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Bookworm.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
