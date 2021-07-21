# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
use Mix.Config

# Configure Mix tasks and generators
config :crud_users,
  ecto_repos: [CrudUsers.Repo]

config :crud_users_web,
  ecto_repos: [CrudUsers.Repo],
  generators: [context_app: :crud_users]

# Configures the endpoint
config :crud_users_web, CrudUsersWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Uhj+zuiOXIR3GoCMj4DlHmmIYG1hso6D057oj9IHZSLmJyodsL9sC2UK7poXHnWH",
  render_errors: [view: CrudUsersWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: CrudUsers.PubSub,
  live_view: [signing_salt: "+0xWyaWp"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
