defmodule Person do
  defstruct name: "", age: 0
  def new(), do: %Person{}

  def increment_age(person) do
    %Person{person | age: person.age + 1}
  end

  def decrement_age(person) do
    %Person{person | age: person.age - 1}
  end

  def can_retire?(person, retirement_age) do
    person.age >= retirement_age
  end
end
