defmodule BancolombiaApp.Hello do
  def greet(target) do
    receive do
      {:greet, message} ->
        IO.inspect(self())
        send(target, {:response, "Hello #{message}"})
        greet(target)

      {:bye, reason} ->
        send(target, {:killed, target, reason})

      # {:EXIT, pid, reason} ->
      #   :error

      _ ->
        greet(target)

        # after
        #   10000 -> IO.puts("Bye")
    end
  end
end
