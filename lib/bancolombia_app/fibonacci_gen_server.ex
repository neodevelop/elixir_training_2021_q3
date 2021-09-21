defmodule BancolombiaApp.FibonacciGenServer do
  use GenServer
  alias BancolombiaApp.Fibonacci

  ## Client impl

  def start_link(_init) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def init(args) do
    {:ok, args}
  end

  def compute(n) do
    GenServer.call(__MODULE__, {:compute, n})
  end

  def handle_call({:compute, n}, _from, state) do
    {:reply, Fibonacci.sequence(n), state}
  end
end
