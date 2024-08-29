defmodule LineOne.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      LineOneWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: LineOne.PubSub},
      # Start the Endpoint (http/https)
      LineOneWeb.Endpoint
      # Start a worker by calling: LineOne.Worker.start_link(arg)
      # {LineOne.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LineOne.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    LineOneWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
