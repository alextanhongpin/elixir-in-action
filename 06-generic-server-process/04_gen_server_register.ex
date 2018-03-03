defmodule KeyValueStore do
  use GenServer

  def init(_) do
    :timer.send_interval(5000, :cleanup)
    {:ok, Map.new}
  end

  def handle_cast({:put, key, value}, state) do
    {:noreply, Map.put(state, key, value)}
  end

  def handle_call({:get, key}, _, state) do
    {:reply, Map.get(state, key), state}
  end

  def start do
    GenServer.start(
      KeyValueStore, 
      nil, 
      name: :key_value_store
    )
  end

  def put(key, value) do
    GenServer.cast(:key_value_store, {:put, key, value})
  end
  
  def get(key) do
    GenServer.call(:key_value_store, {:get, key})
  end
  
  def handle_info(:cleanup, state) do
    IO.puts "performing cleanup..."
    {:noreply, state}
  end

  def handle_info(_, state), do: {:noreply, state}
end

IO.inspect KeyValueStore.__info__(:functions)


{:ok, _} = KeyValueStore.start
IO.inspect KeyValueStore.put(:some_key, :some_value), label: "put"
IO.inspect KeyValueStore.get(:some_key), label: "get"

:timer.sleep(10000)