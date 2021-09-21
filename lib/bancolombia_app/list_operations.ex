defmodule BancolombiaApp.ListOperations do
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

  def filter(list, condition) do
    apply_filter(list, condition, [])
  end

  defp apply_filter([], _condition, res), do: res

  defp apply_filter([h | t], condition, res) do
    case condition.(h) do
      true ->
        apply_filter(t, condition, res ++ [h])

      false ->
        apply_filter(t, condition, res)
    end
  end

  # Obtener la longitud de una lista
  # Obtener el máximo común divisor
end
