Code.load_file("todo_list.ex")

defmodule TodoServer do
  def start do
    spawn(fn -> loop(TodoList.new) end)
  end
  
  def add_entry(todo_server, new_entry) do
    send(todo_server, {:add_entry, new_entry})
  end

  def entries(todo_server, date) do
    # Process.register(self(), :todo_server)
    send(todo_server, {:entries, self(), date})

    receive do
      {:todo_entries, entries} -> entries
    after 5000 ->
      {:error, :timeout}
    end
  end


  defp loop(state) do
    new_state = receive do
      message ->
        process_message(state, message)
    end

    loop(new_state)
  end

  defp process_message(state, {:add_entry, new_entry}) do
    TodoList.add_entry(state, new_entry)
  end

  defp process_message(state, {:entries, caller, date}) do
    send(caller, {:todo_entries, TodoList.entries(state, date)})
    state
  end
end

pid = TodoServer.start
TodoServer.add_entry(pid, %{date: {2013, 1, 1}, title: "The first year"})
TodoServer.add_entry(pid, %{date: {2014, 1, 1}, title: "The second year"})
TodoServer.add_entry(pid, %{date: {2015, 1, 1}, title: "The third year"})

IO.inspect TodoServer.entries(pid, {2013, 1, 1})