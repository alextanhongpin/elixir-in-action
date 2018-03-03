defmodule TodoList do
  def new, do: Map.new

  def add_entry(todo_list, entry) do
    Map.update(
      todo_list,
      entry.date,
      entry,
      &[entry | &1]
    )
  end

  def entries(todo_list, entry) do
    Map.get(todo_list, entry.date, [])
  end
end

todos = TodoList.new

todos = TodoList.add_entry(todos, %{date: {2013, 12, 1}, title: "hello"})
IO.inspect todos, label: "todos"

todo = TodoList.entries(todos, %{date: {2013, 12, 1}})
IO.inspect todo, label: "todo"

# Abstraction

todos = TodoList.new
  |> TodoList.add_entry(%{date: {2013, 1, 1}, title: "new entry"})
  |> TodoList.entries(%{date: {2013, 1, 1}})

IO.inspect todos, label: "result"