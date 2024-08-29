# This file is responsible for configuring your umbrella
# and **all applications** and their dependencies with the
# help of Mix.Config.
#
# Note that all applications in your umbrella share the
# same configuration and dependencies, which is why they
# all use the same configuration file. If you want different
# configurations or dependencies per app, it is best to
# move said applications out of the umbrella.
import Config
# Configure Mix tasks and generators
config :fault,
  ecto_repos: [Fault.Repo]

config :fault_web,
  ecto_repos: [Fault.Repo],
  generators: [context_app: :fault]

# Configures the endpoint
config :fault_web, FaultWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "35YmLFLkMTDMHW1IkiEkcHFk8fRbwgHhGGZOX3ZDopee90XKuF5ACNViocwvFqDS",
  render_errors: [view: FaultWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Fault.PubSub,
  live_view: [signing_salt: "wrxdLkJT"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
