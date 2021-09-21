defmodule BancolombiaApp.AdventOfCode do
  def get_basement(instructions) do
    instructions
    |> String.split("", trim: true)
    |> follow_instructions()
    |> Enum.find(fn {_, f, _} -> f == -1 end)
  end

  def get_floor(instructions) do
    alias String, as: S
    import Enum, only: [map: 2, sum: 1]
    # import Enum, except: [map: 2, sum: 1]

    instructions
    |> S.split("")
    |> map(&eval/1)
    |> sum()
  end

  def get_floor_v2(instructions) do
    instructions
    |> String.split("")
    |> Enum.map(&eval_2/1)
    |> Enum.sum()
  end

  defp eval("("), do: 1
  defp eval(")"), do: -1
  defp eval(_), do: 0

  defp eval_2(char) do
    cond do
      char == "(" -> 1
      char == ")" -> -1
      true -> 0
    end
  end

  defp follow_instructions(list) do
    # follow_instructions(list, {0, 0})
    follow_instructions_2(list, [{0, 0, ""}])
  end

  defp follow_instructions(_l, {_index, -1} = res), do: res
  defp follow_instructions([], res), do: res

  defp follow_instructions([h | t], {index, floor}) do
    follow_instructions(t, {index + 1, eval(h) + floor})
  end

  defp follow_instructions_2([], index_with_floor), do: index_with_floor

  defp follow_instructions_2([h | t], index_with_floor) do
    {index, floor, _} = index_with_floor |> List.last()
    follow_instructions_2(t, index_with_floor ++ [{index + 1, eval(h) + floor, h}])
  end
end
