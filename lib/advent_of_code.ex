defmodule AdventOfCode do
  def get_floor(instructions) do
    alias String, as: S
    import Enum, only: [map: 2, sum: 1]

    instructions
    |> S.split("")
    |> map(&eval/1)
    |> sum()
  end

  defp eval("("), do: 1
  defp eval(")"), do: -1
  defp eval(_), do: 0
end
