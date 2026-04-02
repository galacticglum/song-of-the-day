defmodule SongOfTheDay.Repo do
  use Ecto.Repo,
    otp_app: :song_of_the_day,
    adapter: Ecto.Adapters.Postgres
end
