defmodule BancolombiaApp.TodoSupervisor do
  use Supervisor

  def start_link(init) do
    Supervisor.start_link(__MODULE__, init, name: __MODULE__)
  end

  def init(_init_arg) do
    children = [
      {BancolombiaApp.TodoServer, []}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
