defmodule TodoMvc.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      TodoMvc.Repo,
      # Start the Telemetry supervisor
      TodoMvcWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: TodoMvc.PubSub},
      # Start the Endpoint (http/https)
      TodoMvcWeb.Endpoint
      # Start a worker by calling: TodoMvc.Worker.start_link(arg)
      # {TodoMvc.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: TodoMvc.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TodoMvcWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
