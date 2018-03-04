Code.load_file("database_server.ex")

pool = 1..100 |> 
  Enum.map(fn(_) -> DatabaseServer.start end)

1..5 |> 
Enum.map(fn(query_def) ->
  server_pid = Enum.at(pool, :rand.uniform(100) - 1)
  DatabaseServer.run_async(server_pid, "query #{query_def}")
end) |> 
Enum.map(fn(_) -> DatabaseServer.get_result end) |> 
IO.inspect