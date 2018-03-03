defmodule Todo.Cache do
  use GenServer

  def init(_) do
    Todo.Database.start("./persist/")
    {:ok, Map.new}
  end

  def handle_call({:server_process, todo_list_name}, _, todo_servers) do
    case Map.fetch(todo_servers, todo_list_name) do
      # Server exist in map, reuse
      {:ok, todo_server} -> 
        {:reply, todo_server, todo_servers}
      # Server does not exist, start a new server
      :error ->
        # {:ok, new_server} = Todo.Server.start
        new_server = Todo.Server.start

        {
          :reply,
          new_server,
          Map.put(todo_servers, todo_list_name, new_server)
        }
    end
  end

  def start do
    GenServer.start(__MODULE__, nil,
      name: :cache_server
    )
  end

  def server_process(todo_list_name) do
    GenServer.call(:cache_server, {:server_process, todo_list_name})
  end
end