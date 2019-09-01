import Config

secret_key_base =
  System.get_env("SECRET_KEY_BASE") ||
    raise """
    environment variable SECRET_KEY_BASE is missing.
    You can generate one by calling: mix phx.gen.secret
    """

database_url =
  System.get_env("DATABASE_URL") ||
    raise """
    environment variable DATABASE_URL is missing.
    eg. ecto://postgres:postgres@localhost/db_name
    """

config :bookworm, BookwormWeb.Endpoint,
  http: [:inet6, port: System.get_env("PORT", "4000") |> String.to_integer()],
  url: [host: "localhost", port: System.get_env("PORT")],
  secret_key_base: secret_key_base

config :bookworm, Bookworm.Repo,
  adapter: Ecto.Adapters.Postgres,
  url: database_url,
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10")
