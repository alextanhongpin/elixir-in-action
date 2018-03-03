defmodule MultiMap do
  @doc """
  Creates a new map

  Returns `%{}`

  ## Examples
    
    iex> MultiMap.new
    %{}

  """
  def new, do: Map.new

  @doc """
    Add an item into the map

    Returns the updated map

    ## Examples

      iex> MultiMap.add(1, "foo")
      %{1 => ["foo"]}
  """
  def add(map, key, value) do
    Map.update(
      map,
      key,
      [value],
      &[value | &1]
    )
  end


  @doc """
    Get an item from the map

    Returns the value for the given key

    ## Examples

      iex> MultiMap.get(1, "foo")
      ["foo"]
  """
  def get(dict, key) do
    Map.get(dict, key, [])
  end
end

defmodule TodoList do
  def new, do: MultiMap.new

  def add_entry(todo_list, date, title) do
    MultiMap.add(todo_list, date, title)
  end

  def entries(todo_list, date) do
    MultiMap.get(todo_list, date)
  end
end

todolist = TodoList.new
IO.inspect todolist, label: "create new"

todolist = TodoList.add_entry(todolist, 2013, "hello")
IO.inspect todolist, label: "insert key value"

IO.inspect TodoList.entries(todolist, 2013), label: "get key"