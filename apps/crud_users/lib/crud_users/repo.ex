defmodule CrudUsers.Repo do
  use Ecto.Repo,
    otp_app: :crud_users,
    adapter: Ecto.Adapters.Postgres
end
