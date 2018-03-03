run_query = fn(query_def) ->
  :timer.sleep(2000)
  "result #{query_def}"
end

async_query = fn(query_def) ->
  caller = self()
  spawn(fn -> 
    send(caller, {:query_result, run_query.(query_def)})
  end)
end

get_result = fn ->
  receive do
    {:query_result, result} -> result
  end
end

1..5
|> Enum.map(&async_query.(&1))
|> Enum.map(fn(_)-> get_result.() end)
|> IO.inspect