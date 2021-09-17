defmodule Fibonacci do
  def sequence(0), do: 0
  def sequence(1), do: 1

  def sequence(n) do
    sequence(n - 1) + sequence(n - 2)
  end

  def handle_message({:compute, n}, parent) do
    send(parent, {:ok, sequence(n)})
  end

  def handle_message(:kill, parent) do
    send(parent, {:ok, :killed})
  end

  def handle_message(_, _parent) do
    :ok
  end
end
