defmodule FibonacciServer do
  def start() do
    spawn(FibonacciServer, :loop, [])
  end

  def loop() do
    receive do
      {:compute, n} -> IO.puts(Fibonacci.sequence(n))
      _ -> IO.puts("Error")
    end

    loop()
  end
end
