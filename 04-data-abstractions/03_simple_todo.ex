defmodule TodoList do
  def new, do: Map.new

  @doc """
  Add an entry to the todo list

  Returns `:ok`

  ## Examples

      iex> TodoList.add_entry(todo_list, "2017", "hello")
      :ok
  """
  def add_entry(todo_list, date, title) do
    Map.update(
      todo_list,
      date,
      [title], # If no value exists for the given key, use the initial value
      fn(titles) -> [title | titles] end # Else, call the updater lambda
    )
  end

  @doc """
  Get the entries of the todo list

  Returns `something`
  """
  def entries(todo_list, date) do
    # The last value is the default value if the key does not exist
    Map.get(todo_list, date, [])
  end
end

