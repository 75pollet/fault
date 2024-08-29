defmodule Fault.Repo do
  use Ecto.Repo,
    otp_app: :fault,
    adapter: Ecto.Adapters.Postgres
end
