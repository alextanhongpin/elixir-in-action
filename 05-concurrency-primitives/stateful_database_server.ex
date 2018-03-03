defmodule DatabaseServer do
  def start do
    initial_state = :rand.uniform(1000) #Map.new
    spawn(fn() -> loop(initial_state) end)
  end

  defp loop(state) do
    receive do
      {:run_query, caller, query_def} ->
        query_result = run_query(state, query_def)
        send(caller, {:query_result, query_result})
    end

    loop(state)
  end

  defp run_query(connection, query_def) do
    :timer.sleep(2000)
    "connection #{connection} #{query_def} result"
  end

  def run_async(server_pid, query_def) do
    caller = self()
    send(server_pid, {:run_query, caller, query_def})
  end 

  def get_result do
    receive do
      {:query_result, result} -> result
    after 5000 -> 
      {:error, :timeout}
    end
  end
end