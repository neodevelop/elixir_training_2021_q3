defmodule BancolombiaApp do
  use Application

  def start(_type, _args) do
    children = [
      {BancolombiaApp.TodoSupervisor, []}
    ]

    Supervisor.start_link(children, strategy: :one_for_one)
  end
end
