defmodule BancolombiaAppTest do
  use ExUnit.Case
  doctest BancolombiaApp

  test "greets the world" do
    assert BancolombiaApp.hello() == :world
  end
end
