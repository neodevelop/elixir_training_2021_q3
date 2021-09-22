defmodule BancolombiaApp.Todo do
  defstruct id: nil, description: nil, expiration: nil, done?: false

  def new(description) do
    %__MODULE__{description: description}
  end

  def find(todo_list, query) do
  end

  def get(todo_list, id) do
  end

  def update(todo, attrs) do
  end

  def finish(todo) do
    %__MODULE__{todo | done?: true}
  end
end
