defmodule BancolombiaApp.Math do
  @moduledoc """
  Este es el componente que agrupa las funciones matemáticas
  que vamos a estar utilizando en nuestra aplicación
  """

  @doc "Esta es la función que suma dos números"
  def sum(a, b) do
    a + b
  end

  @doc "Esta es la función que resta dos números"
  def sub(a, b), do: a - b

  defmodule Geometry do
    @pi 3.1416
    # def square_area(a), do: rectangle_area(a, a)
    # def rectangle_area(a, b), do: a * b
    def area({:rectangle, a, b}) do
      a * b
    end

    def area({:square, a}) do
      a * a
    end

    def area({:circle, r}) do
      r * r * @pi
    end

    def area(_) do
      :unsupported
    end

    def area_2(elem) do
      case elem do
        {:rectangle, a, b} -> a * b
        {:square, a} when is_number(a) -> a * a
        {:circle, r} -> r * r * @pi
        _ -> :unsupported
      end
    end
  end
end
