defmodule GenericServer do
  def start(module, parent) do
    spawn(fn -> loop(module, parent) end)
  end

  def loop(callback_module, parent) do
    receive do
      :kill ->
        :killed

      msg ->
        callback_module.handle_message(msg, parent)
        loop(callback_module, parent)
    end
  end
end
