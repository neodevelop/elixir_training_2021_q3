defmodule Math do
  def sum(a, b) do
    a + b
  end

  def sub(a, b), do: a - b

  defmodule Geometry do
    # def square_area(a), do: rectangle_area(a, a)
    # def rectangle_area(a, b), do: a * b
    def area({:rectangle, a, b}) do
      a * b
    end

    def area({:square, a}) do
      a * a
    end

    def area({:circle, r}) do
      r * r * 3.14
    end

    def area(_) do
      :unsupported
    end
  end
end
