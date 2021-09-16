defmodule Fibonacci do
  def sequence(0), do: 0
  def sequence(1), do: 1

  def sequence(n) do
    sequence(n - 1) + sequence(n - 2)
  end

  def handle_message(parent) do
    receive do
      {:compute, n} ->
        send(parent, {:ok, Fibonacci.sequence(n)})
        handle_message(parent)

      :kill ->
        send(parent, {:ok, :killed})

      _ ->
        send(parent, {:error, :invalid})
        handle_message(parent)
    end
  end
end
