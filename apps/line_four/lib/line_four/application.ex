defmodule LineFour.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      LineFourWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: LineFour.PubSub},
      # Start the Endpoint (http/https)
      LineFourWeb.Endpoint
      # Start a worker by calling: LineFour.Worker.start_link(arg)
      # {LineFour.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LineFour.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    LineFourWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
