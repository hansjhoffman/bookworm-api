defmodule Bookworm.Repo do
  use Ecto.Repo,
    otp_app: :bookworm,
    adapter: Ecto.Adapters.Postgres
end
