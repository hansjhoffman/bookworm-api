use Mix.Config

secret_key_base =
  System.get_env("SECRET_KEY_BASE") ||
    raise """
    environment variable SECRET_KEY_BASE is missing.
    You can generate one by calling: mix phx.gen.secret
    """

config :bookworm, BookwormWeb.Endpoint,
  http: [:inet6, port: System.get_env("PORT", "4000") |> String.to_integer()],
  url: [host: "localhost", port: System.get_env("PORT")],
  secret_key_base: secret_key_base,
  server: true,
  version: Application.spec(:bookworm, :vsn)

config :logger, level: :info
