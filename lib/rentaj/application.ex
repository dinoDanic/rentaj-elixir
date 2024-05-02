defmodule Rentaj.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      RentajWeb.Telemetry,
      Rentaj.Repo,
      {DNSCluster, query: Application.get_env(:rentaj, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Rentaj.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Rentaj.Finch},
      # Start a worker by calling: Rentaj.Worker.start_link(arg)
      # {Rentaj.Worker, arg},
      # Start to serve requests, typically the last entry
      RentajWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Rentaj.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    RentajWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
