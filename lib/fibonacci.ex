defmodule Fibonacci do
  def sequence(0), do: 0
  def sequence(1), do: 1

  def sequence(n) do
    sequence(n - 1) + sequence(n - 2)
  end

  def handle_message({:compute, n}, parent, state) do
    send(parent, {:ok, sequence(n)})
    {:ok, state + 1}
  end

  def handle_message(:show, parent, state) do
    send(parent, {:ok, state})
    {:ok, state}
  end

  def handle_message(_, _parent, state) do
    {:ok, state + 1}
  end
end
