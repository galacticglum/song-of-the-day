import Config

config :song_of_the_day, SongOfTheDay.Repo,
  pool: Ecto.Adapters.SQL.Sandbox,
  pool_size: System.schedulers_online() * 2

config :logger, level: :warn

config :song_of_the_day, SongOfTheDay.Mailer, adapter: Swoosh.Adapters.Test
