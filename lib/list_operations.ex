defmodule ListOperations do
  def sum(list) do
    sum(list, 0)
  end

  defp sum([], n), do: n
  defp sum([h | t], n), do: sum(t, n + h)

  def my_map(list, function) do
    exec_my_map(list, function, [])
  end

  defp exec_my_map([], _function, res), do: res

  defp exec_my_map([h | t], function, res) do
    exec_my_map(t, function, res ++ [function.(h)])
  end

  # Obtener la longitud de una lista
  # Obtener el máximo común divisor
end
