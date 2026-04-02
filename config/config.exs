# This file is responsible for configuring your application and its
# dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
import Config

config :song_of_the_day,
  ecto_repos: [SongOfTheDay.Repo],
  generators: [timestamp_type: :utc_datetime]

config :song_of_the_day, SongOfTheDayWeb.Endpoint,
  # Enable both ipv4 and ipv6 on all interfaces. By the way, the port is
  # configured with an environment variable and it's in the runtime.exs config.
  http: [ip: {0, 0, 0, 0, 0, 0, 0, 0}],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [html: SongOfTheDayWeb.ErrorHTML, json: SongOfTheDayWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: SongOfTheDay.PubSub,
  live_view: [signing_salt: "aC4Hk8o2"]

config :song_of_the_day, SongOfTheDay.Repo, adapter: Ecto.Adapters.Postgres

config :logger, :default_formatter,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

config :phoenix, :json_library, Jason

config :song_of_the_day, SongOfTheDay.Mailer, adapter: Swoosh.Adapters.Local

config :swoosh, :api_client, false

import_config "#{Mix.env()}.exs"
