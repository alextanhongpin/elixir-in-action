defmodule KeyValueStore do
  use GenServer

  def init(initial_state) do
    :timer.send_interval(5000, :cleanup)
    {:ok, initial_state}
  end

  def handle_cast({:put, key, value}, state) do
    {:noreply, Map.put(state, key, value)}
  end

  def handle_call({:get, key}, _, state) do
    {:reply, Map.get(state, key), state}
  end

  def start do
    initial_state = Map.new
    GenServer.start(KeyValueStore, initial_state)
  end

  def put(pid, key, value) do
    GenServer.cast(pid, {:put, key, value})
  end
  
  def get(pid, key) do
    GenServer.call(pid, {:get, key})
  end
  
  def handle_info(:cleanup, state) do
    IO.puts "performing cleanup..."
    {:noreply, state}
  end

  def handle_info(_, state), do: {:noreply, state}
end

IO.inspect KeyValueStore.__info__(:functions)


{:ok, pid} = KeyValueStore.start
IO.inspect KeyValueStore.put(pid, :some_key, :some_value), label: "put"
IO.inspect KeyValueStore.get(pid, :some_key), label: "get"

:timer.sleep(10000)
