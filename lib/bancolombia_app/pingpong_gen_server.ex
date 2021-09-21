defmodule PingPongGenServer do
  use GenServer

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, [], opts)
  end

  def init(args) do
    {:ok, args}
  end

  def handle_cast({:ping, other}, state) do
    IO.puts("PING en #{inspect(self())} -->")
    :timer.sleep(3000)
    GenServer.cast(other, {:pong, self()})
    {:noreply, state}
  end

  def handle_cast({:pong, other}, state) do
    IO.puts("<-- PONG en #{inspect(self())} ")
    :timer.sleep(3000)
    GenServer.cast(other, {:ping, self()})
    {:noreply, state}
  end
end
