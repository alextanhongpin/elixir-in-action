defmodule Todo.DatabaseWorker do
  use GenServer

	def start(db_folder) do
		IO.puts "Starting database worker."
		
    GenServer.start(
      __MODULE__, 
      db_folder
      # name: __MODULE__
      # name: :database_server # Locally registers the process
    )   
  end

  def store(worker_pid, key, data) do
    GenServer.cast(worker_pid, {:store, key, data})
  end

  def get(worker_pid, key) do
    GenServer.call(worker_pid, {:get, key})
  end

	@impl GenServer
  def init(db_folder) do
    # File.mkdir_p(db_folder)
    {:ok, db_folder}
  end

	@impl GenServer
	def handle_cast({:store, key, data}, db_folder) do
		db_folder
		|> file_name(key)
		|> File.write!(:erlang.term_to_binary(data))
    # spawn(fn -> 
    #   file_name(db_folder, key)
    #   |> File.write!(:erlang.term_to_binary(data))
    # end)

    {:noreply, db_folder}
  end

	@impl GenServer
  def handle_call({:get, key}, _, db_folder) do
    # spawn(fn -> 
			data = 
				case File.read(file_name(db_folder, key)) do
					{:ok, contents} -> :erlang.binary_to_term(contents)
					_ -> nil
				end

      # GenServer.reply(caller, data)
    # end)

    {:reply, data, db_folder}
    # {:noreply, db_folder}
  end

  defp file_name(db_folder, key), do: "#{db_folder}/#{key}"
end