defmodule BancolombiaApp.Fibonacci do
  def sequence(0), do: 0
  def sequence(1), do: 1

  def sequence(n) do
    sequence(n - 1) + sequence(n - 2)
  end

  def handle_message({:compute, n}, parent, state) do
    result = sequence(n)
    send(parent, {:ok, result})
    {:ok, [result | state]}
  end

  def handle_message(:show, parent, state) do
    send(parent, {:ok, state})
    {:ok, state}
  end

  def handle_message(_, _parent, state) do
    {:ok, state}
  end
end
