defmodule NatsunTest do
  use ExUnit.Case
  doctest Natsun

  test "greets the world" do
    assert Natsun.hello() == :world
  end
end
