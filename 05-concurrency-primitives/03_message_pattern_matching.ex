send(self(), {:message, 1})
send(self(), {:ok, 2})

receive do
  {:message, val} -> IO.puts "received message: #{val}"
  {:ok, val} -> IO.puts "received ok: #{val}"
end

receive do
  {:message, val} -> IO.puts "received message: #{val}"
  {:ok, val} -> IO.puts "received ok: #{val}"
end
receive do
  {:message, val} -> IO.puts "received message: #{val}"
  after 1000 -> IO.puts "message not received"
end