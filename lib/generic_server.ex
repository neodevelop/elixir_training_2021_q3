defmodule GenericServer do
  def start(module, parent) do
    spawn(module, :handle_message, [parent])
  end
end
