defmodule BancolombiaApp.Functional do
  def unique_letters(name) do
    "Hello " <> name
  end

  def ask_and_respond() do
    name = IO.gets("Cuál es tu nombre? ")
    IO.puts(unique_letters(name))
    :ok
  end
end
