defmodule BancolombiaApp.Parallel do
  def pmap(collection, fun) do
    collection
    |> Enum.map(&spawn_process_for_my_collection(&1, self(), fun))
    |> Enum.map(&await_for_response/1)
  end

  defp spawn_process_for_my_collection(e, parent, fun) do
    spawn_link(fn ->
      send(parent, {self(), fun.(e)})
    end)
  end

  defp await_for_response(pid) do
    receive do
      {^pid, result} -> result
    end
  end
end
