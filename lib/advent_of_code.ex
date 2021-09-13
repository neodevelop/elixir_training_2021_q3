defmodule AdventOfCode do
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
end
