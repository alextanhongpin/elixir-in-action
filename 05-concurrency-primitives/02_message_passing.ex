send(self(), "a message")

receive do
  message -> IO.puts "received: #{message}"
end