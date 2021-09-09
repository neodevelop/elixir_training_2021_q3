defmodule ListOperations do
  def sum(list) do
    sum(list, 0)
  end

  defp sum([], n), do: n
  defp sum([h | t], n), do: sum(t, n + h)

  # Obtener la longitud de una lista
  # Obtener el máximo común divisor
end
