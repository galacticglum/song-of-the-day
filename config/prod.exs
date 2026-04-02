import Config

config :song_of_the_day, SongOfTheDayWeb.Endpoint,
  cache_static_manifest: "priv/static/cache_manifest.json",
  server: true

config :logger, level: :info

config :swoosh, api_client: Swoosh.ApiClient.Req
