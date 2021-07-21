defmodule CrudUsers.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      CrudUsers.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: CrudUsers.PubSub}
      # Start a worker by calling: CrudUsers.Worker.start_link(arg)
      # {CrudUsers.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: CrudUsers.Supervisor)
  end
end
