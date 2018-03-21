try_helper = fn(fun) ->
	try do
		fun.()
		IO.puts "No error"
	catch type, value ->
		IO.puts "Error\n #{inspect type}\n #{inspect value}"
	end
end

try_helper.(fn -> raise("Something went wrong") end)
# Error
#  :error
#  %RuntimeError{message: "Something went wrong"}

try_helper.(fn -> throw("Thrown value") end)
# Error
#  :throw
#  "Thrown value"

result = 
	try do
		throw "Thrown value"
	catch type, value -> {type, value}
	end

IO.inspect result, label: "thrown value"
# thrown value: {:throw, "Thrown value"}

try do
	raise "Something went wrong"
	catch
		_, _ -> IO.puts "Error caught"
	after
		IO.puts "Cleanup code"
end