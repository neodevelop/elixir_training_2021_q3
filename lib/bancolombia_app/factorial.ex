defmodule BancolombiaApp.Factorial do
  def of(0), do: 1
  def of(n) when is_number(n) and n > 0, do: n * of(n - 1)
  def of(_), do: {:error, :invalid}

  def handle_message({:compute, n}, parent) do
    send(parent, {:ok, of(n)})
  end

  def handle_message(_, parent) do
    send(parent, {:error, :invalid})
  end
end
