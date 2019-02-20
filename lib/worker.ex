defmodule Natsun.Worker do
  alias Natsun.Message

  def start_link(gnat, topic, callback) do
    pid = spawn_link(__MODULE__, :init, [gnat, topic, callback])
    {:ok, pid}
  end

  def init(gnat, topic, callback) do
    Gnat.sub(gnat, self(), topic)
    loop(callback)
  end

  def loop(callback) do
    receive do
      {:msg, %{body: msg}} ->
        message =
          msg
          |> Poison.decode!(as: %Message{})

        apply(callback, [message])
    end

    loop(callback)
  end
end
