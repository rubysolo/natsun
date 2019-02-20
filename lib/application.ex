defmodule Natsun.Application do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec

    children = [
      supervisor(Natsun.Router, []),
    ]

    opts = [strategy: :one_for_one, name: Natsun.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
