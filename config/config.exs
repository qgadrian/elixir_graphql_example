# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :graphql_test,
  ecto_repos: [GraphqlTest.Repo]

# Configures the endpoint
config :graphql_test, GraphqlTest.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "Egs3H05ZI1lNuvEox4CtyEPto/NfjCmS3/R1akvqxuzJy58ybDWRO5/BSRJbz2mk",
  render_errors: [view: GraphqlTest.ErrorView, accepts: ~w(html json)],
  pubsub: [name: GraphqlTest.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
