defmodule Hello do
  def greet do
    receive do
      {:greet, message} ->
        IO.puts("Hello #{message}")
        greet()

      {:bye, reason} ->
        IO.puts("Bye for #{reason}")

      {:EXIT, pid, reason} ->
        :error

      _ ->
        IO.puts("No message")
        greet()
    after
      10000 -> IO.puts("Bye")
    end
  end
end
