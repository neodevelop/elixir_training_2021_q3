defmodule BancolombiaApp.TodoServer do
  use GenServer

  ## Client impl

  def list(server) do
    GenServer.call(server, :get)
  end

  def put(server, todo) do
    GenServer.cast(server, {:put, todo})
  end

  ## Callbacks impl
  @impl true
  def init(args) do
    {:ok, args}
  end

  @impl true
  def handle_call(:get, _from, state) do
    {:reply, state, state}
  end

  @impl true
  def handle_cast({:put, element}, state) do
    {:noreply, [element | state]}
  end
end
