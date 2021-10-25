defmodule PingPong do
  def handle_message do
    receive do
      {:ping, from} ->
        IO.puts("PING")
        :timer.sleep(1000)
        send(from, {:pong, self()})
        handle_message()

      {:pong, from} ->
        IO.puts("PONG")
        :timer.sleep(1000)
        send(from, {:ping, self()})
        handle_message()
    end
  end

  def handle_message({:ping, pid}, _parent, state) do
    IO.puts("PING")
    :timer.sleep(1000)
    send(pid, {:pong, self()})
    {:ok, state}
  end

  def handle_message({:pong, pid}, _parent, state) do
    IO.puts("PONG")
    :timer.sleep(1000)
    send(pid, {:ping, self()})
    {:ok, state}
  end
end
