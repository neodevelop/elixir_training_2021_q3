defmodule FibonacciServer do
  def start() do
    spawn(fn ->
      receive do
        {:compute, n} -> IO.puts(Fibonacci.sequence(n))
        _ -> IO.puts("Error")
      end
    end)
  end
end
