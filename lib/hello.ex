defmodule Hello do
  def greet do
    receive do
      {:greet, message} ->
        IO.puts("Hello #{message}")
        greet()

      _ ->
        IO.puts("No message")
        greet()
    end
  end
end
