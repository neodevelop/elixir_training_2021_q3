defmodule BancolombiaApp.FibonacciServer do
  def start(parent) do
    spawn(__MODULE__, :loop, [parent])
  end

  def loop(parent) do
    receive do
      {:compute, n} ->
        send(parent, {:ok, Fibonacci.sequence(n)})
        loop(parent)

      :kill ->
        send(parent, {:ok, :killed})

      _ ->
        send(parent, {:error, :invalid})
        loop(parent)
    end
  end
end
