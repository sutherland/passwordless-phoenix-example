defmodule Passwordless.Repo do
  use Ecto.Repo,
    otp_app: :passwordless,
    adapter: Ecto.Adapters.Postgres
end
