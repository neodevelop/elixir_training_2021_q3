defmodule GenericServer do
  def start(module) do
    Process.flag(:trap_exit, true)
    parent = self()
    spawn_link(fn -> loop(module, parent, 0) end)
  end

  def loop(callback_module, parent, state) do
    receive do
      :kill ->
        :killed

      msg ->
        {:ok, new_state} = callback_module.handle_message(msg, parent, state)
        loop(callback_module, parent, new_state)
    end
  end
end
