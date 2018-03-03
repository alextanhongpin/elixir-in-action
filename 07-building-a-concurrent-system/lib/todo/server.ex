# defmodule Todo.Server do
#   def start do
#     spawn(fn -> loop(Todo.List.new) end)
#   end
  
#   def add_entry(todo_server, new_entry) do
#     send(todo_server, {:add_entry, new_entry})
#   end

#   def entries(todo_server, date) do
#     # Process.register(self(), :todo_server)
#     send(todo_server, {:entries, self(), date})

#     receive do
#       {:todo_entries, entries} -> entries
#     after 5000 ->
#       {:error, :timeout}
#     end
#   end


#   defp loop(state) do
#     new_state = receive do
#       message ->
#         process_message(state, message)
#     end

#     loop(new_state)
#   end

#   defp process_message(state, {:add_entry, new_entry}) do
#     Todo.List.add_entry(state, new_entry)
#   end

#   defp process_message(state, {:entries, caller, date}) do
#     send(caller, {:todo_entries, Todo.List.entries(state, date)})
#     state
#   end
# end

defmodule Todo.Server do
  use GenServer

  def init(name) do
    # send(self(), :real_init)
    # {:ok, nil}
    {:ok, {name, Todo.Database.get(name) || Todo.List.new}}
  end

  # def handle_info(:read_init, state) do
  #   {name, Todo.Database.get(name) || Todo.List.new}
  # end

  def handle_cast({:add_entry, new_entry}, {name, todo_list}) do
    new_state = Todo.List.add_entry(todo_list, new_entry)
    Todo.Database.store(name, new_state)
    {:noreply, {name, new_state}}
  end 

  def handle_call({:entries, date}, _, todo_list) do
    {:reply, Todo.List.entries(todo_list, date)}
  end 

  def start do
    GenServer.start(__MODULE__, nil,
      name: :server
    )
  end

  def add_entry(new_entry) do
    GenServer.cast(:server, {:add_entry, new_entry})
  end

  def entries(date) do
    GenServer.call(:server, {:entries, date})
  end
end