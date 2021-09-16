defmodule Factorial do
  def of(0), do: 1
  def of(n) when is_number(n) and n > 0, do: n * of(n - 1)
  def of(_), do: {:error, :invalid}

  def handle_message(parent) do
    receive do
      {:compute, n} ->
        send(parent, {:ok, of(n)})
        handle_message(parent)

      :kill ->
        send(parent, {:ok, :killed})

      _ ->
        send(parent, {:error, :invalid})
        handle_message(parent)
    end
  end
end
