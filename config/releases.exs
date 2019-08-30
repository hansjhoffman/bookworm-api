import Config

config :bookworm, Bookworm.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: System.get_env("DB_USER", "postgres"),
  password: System.get_env("DB_PWD", "postgres"),
  hostname: System.get_env("DB_HOST", "localhost"),
  database: System.get_env("DB_NAME", "bookworm_prod"),
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10")
