defmodule AdventOfCode do
  def get_floor(instructions) do
    eval = fn
      "(" -> 1
      ")" -> -1
      _ -> 0
    end

    instructions
    |> String.split("")
    |> Enum.map(eval)
    |> Enum.sum()
  end
end
