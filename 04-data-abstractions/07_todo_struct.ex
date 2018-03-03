Code.load_file("todolist.ex")

todos = TodoList.new 
|> TodoList.add_entry(
    %{date: {2013, 1, 1}, title: "Dentist"}
  )
|> TodoList.add_entry(
    %{date: {2014, 1, 1}, title: "Shopping"}
  )
|> TodoList.add_entry(
    %{date: {2015, 1, 1}, title: "Movies"}
  )
|> IO.inspect
|> TodoList.update_entry(1, &Map.put(&1, :date, {2013, 1, 14}))
|> IO.inspect
|> TodoList.update_entry(2, &Map.put(&1, :title, "Shopping edited"))
|> IO.inspect


new_todos = todos.entries |> Map.values |> TodoList.new
IO.inspect new_todos