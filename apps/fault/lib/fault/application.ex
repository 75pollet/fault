defmodule Fault.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      Fault.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Fault.PubSub}
      # Start a worker by calling: Fault.Worker.start_link(arg)
      # {Fault.Worker, arg}
    ]

    Supervisor.start_link(children, strategy: :one_for_one, name: Fault.Supervisor)
  end
end
