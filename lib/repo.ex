defmodule Enderecify.Repo do
  use Ecto.Repo,
    otp_app: :enderecify_api,
    adapter: Ecto.Adapters.Postgres
end
