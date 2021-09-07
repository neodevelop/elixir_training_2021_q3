defmodule Greeter do
  def hello(), do: "#{phrase()} anon!"
  def hello(name), do: "Hello " <> name
  def hello(name, lastname), do: "Hello #{name} Family #{lastname}"

  defp phrase(), do: "Whats'up "
end
