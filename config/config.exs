# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :passwordless, Passwordless.Mailer, adapter: Bamboo.LocalAdapter

config :passwordless,
  ecto_repos: [Passwordless.Repo]

# Configures the endpoint
config :passwordless, PasswordlessWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "bUiIf6hb/z/Ok3lQlFdnzNG8XfWKjS7x7jOGMkY/fxmSt7myV1jsLT4xGpgJ4ejL",
  render_errors: [view: PasswordlessWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Passwordless.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
