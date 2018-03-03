run_query = fn(query_def) -> 
  :timer.sleep(2000)
  "#{query_def} result"
end

IO.inspect run_query.("SELECT 1 + 1")

# Process that runs for 10 seconds
# 1..5
# |> Enum.map(&run_query.(&1))
# |> IO.inspect

# spawn(fn -> IO.puts(run_query.("hello")) end)

# :timer.sleep(4000)

async_query = fn(query_def) ->
  spawn(fn -> IO.puts(run_query.(query_def)) end)
end

IO.inspect async_query.("hello world"), label: "got pid"


1..5 
|> Enum.map(&async_query.("query #{&1}"))
|> IO.inspect
:timer.sleep(4000)