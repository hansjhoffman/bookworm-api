use Mix.Config

config :bookworm, BookwormWeb.Endpoint,
  server: true,
  version: Application.spec(:bookworm, :vsn)

config :logger, level: :info
