defmodule Natsun.Router do
  use Supervisor

  alias Natsun.{
    Listing,
    User,
    Worker,
  }

  def start_link do
    Supervisor.start_link(__MODULE__, :ok)
  end

  def init(:ok) do
    {:ok, gnat} = Gnat.start_link()

    children =
      handlers()
      |> Enum.map(fn {topic, callback} ->
        worker(Worker, [gnat, topic, callback], id: topic, restart: :permanent)
      end)

    supervise(children, strategy: :one_for_one)
  end

  def handlers do
    [
      {"user.created.listing", &Listing.created/1},
      {"user.*.*",             &User.activity/1},
    ]
  end
end
