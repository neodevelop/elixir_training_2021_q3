defmodule Math do
  def sum(a, b) do
    a + b
  end

  def sub(a, b), do: a - b

  defmodule Geometry do
    def square_area(a), do: rectangle_area(a, a)
    def rectangle_area(a, b), do: a * b
  end
end
