defmodule Todo.Server do
  use GenServer

  @impl GenServer
  def init(name) do
    # send(self(), :real_init)
    # {:ok, nil}
    {:ok, {name, Todo.Database.get(name) || Todo.List.new}}
  end

  # def handle_info(:read_init, state) do
  #   {name, Todo.Database.get(name) || Todo.List.new}
  # end

  @impl GenServer
  def handle_cast({:add_entry, new_entry}, {name, todo_list}) do
    new_state = Todo.List.add_entry(todo_list, new_entry)
    Todo.Database.store(name, new_state)
    {:noreply, {name, new_state}}
  end 

  @impl GenServer
  def handle_call({:entries, date}, _from, {name, todo_list}) do
    # entries = Todo.Database.get(name)
    # {:reply, {name, new_state}, new_state}
    {
      :reply,
      Todo.List.entries(todo_list, date),
      {name, todo_list}
    }
  end 

  def start(list_name) do
    IO.puts "Starting to-do server for name #{list_name}"
    GenServer.start(
      # __MODULE__, 
      Todo.Server,
      list_name
      # name: :server
    )
  end

  def add_entry(todo_server, new_entry) do
    GenServer.cast(todo_server, {:add_entry, new_entry})
  end

  def entries(todo_server, date) do
    GenServer.call(todo_server, {:entries, date})
  end
end