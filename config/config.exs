# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :chatter,
  ecto_repos: [Chatter.Repo]

# Configures the endpoint
config :chatter, Chatter.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "uwtt4GG610DEvbaCF2XS0be5SQy0W6kf9P9RsVtMGUFyindkShCfyBAGuGqbCD/i",
  render_errors: [view: Chatter.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Chatter.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Esto lo puse yo para Guardian (autenticador, es como warden de ruby)
config :guardian, Guardian,
  allowed_algos: ["HS512"], #opcional
  verify_module: Guardian.JWT, #opcional
  issuer: "Chatter",
  ttl: {30, :days},
  allowed_drift: 2000,
  verify_issuer: true, #opcional
  secret_key: "cSJhTneE0OF0WOHDwdUJJlKy/YNVXfgHJ7nEcyI2YxWWR+9RArO2RXo/zyWcUkPr",
  serializer: Chatter.GuardianSerializer

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
