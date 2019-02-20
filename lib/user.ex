defmodule Natsun.User do
  alias Natsun.Message

  def activity(%Message{}=msg) do
    IO.puts("a user did a thing!")
  end
end
