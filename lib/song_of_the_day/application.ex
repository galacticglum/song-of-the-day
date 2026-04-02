defmodule SongOfTheDay.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      SongOfTheDayWeb.Telemetry,
      SongOfTheDay.Repo,
      {DNSCluster,
       query: Application.get_env(:song_of_the_day, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: SongOfTheDay.PubSub},
      SongOfTheDayWeb.Endpoint
      # Start a worker by calling: SongOfTheDay.Worker.start_link(arg)
      # {SongOfTheDay.Worker, arg}
    ]

    opts = [strategy: :one_for_one, name: SongOfTheDay.Supervisor]
    Supervisor.start_link(children, opts)
  end

  @impl true
  def config_change(changed, _new, removed) do
    SongOfTheDayWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
