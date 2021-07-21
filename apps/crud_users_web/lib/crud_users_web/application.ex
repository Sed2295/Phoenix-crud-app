defmodule CrudUsersWeb.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      CrudUsersWeb.Telemetry,
      # Start the Endpoint (http/https)
      CrudUsersWeb.Endpoint
      # Start a worker by calling: CrudUsersWeb.Worker.start_link(arg)
      # {CrudUsersWeb.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CrudUsersWeb.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    CrudUsersWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
