defmodule BancolombiaApp.TodoServer do
  use GenServer

  ## Client impl

  def start_link(_init) do
    GenServer.start_link(__MODULE__, [], name: __MODULE__)
  end

  def list(pid) do
    GenServer.call(pid, :get)
  end

  def put(pid, todo) do
    GenServer.cast(pid, {:put, todo})
  end

  # TODO
  # def find()
  # def update()
  # def finish()

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
