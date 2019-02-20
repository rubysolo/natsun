defmodule Natsun.Listing do
  alias Natsun.Message

  def created(%Message{}=msg) do
    IO.puts("a listing was created!")
  end
end
