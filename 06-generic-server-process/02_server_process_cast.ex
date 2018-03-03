Code.load_file("server_process_cast.ex")

defmodule KeyValueStore do
  def init do
    Map.new
  end

  def handle_call({:put, key, value}, state) do
    {:ok, Map.put(state, key, value)}
  end

  def handle_call({:get, key}, state) do
    {Map.get(state, key), state}
  end

  def handle_cast({:put, key, value}, state) do
    Map.put(state, key, value)
  end

  def put(pid, key, value) do
    ServerProcess.cast(pid, {:put, key, value})
  end

  def get(pid, key) do
    ServerProcess.call(pid, {:get, key})
  end
end

pid = ServerProcess.start(KeyValueStore)
# IO.inspect ServerProcess.call(pid, {:put, :some_key, :some_value}), label: "put"
# IO.inspect ServerProcess.call(pid, {:get, :some_key}), label: "get"

IO.inspect KeyValueStore.put(pid, :some_key, :some_value), label: "put"
IO.inspect KeyValueStore.get(pid, :some_key), label: "get"