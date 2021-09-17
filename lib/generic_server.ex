defmodule GenericServer do
  def start(module, init) do
    Process.flag(:trap_exit, true)
    parent = self()
    spawn_link(__MODULE__, :loop, [module, parent, init])
  end

  def call(process, message) do
    send(process, message)
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
