defmodule AdventOfCode do
  def get_floor(instructions) do
    instructions
    |> String.split("")
    |> Enum.map(fn
      "(" -> 1
      ")" -> -1
      _ -> 0
    end)
    |> Enum.sum()
  end
end
