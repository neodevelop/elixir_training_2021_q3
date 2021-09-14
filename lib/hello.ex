defmodule Hello do
  def greet do
    receive do
      {:greet, message} ->
        IO.puts("Hello #{message}")

      _ ->
        IO.puts("No message")
    end
  end
end
