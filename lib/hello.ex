defmodule Hello do
  def greet do
    receive do
      _ -> IO.puts("Hello")
    end
  end
end
