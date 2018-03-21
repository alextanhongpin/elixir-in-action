spawn(fn ->
	spawn_link(fn -> 
		:timer.sleep(1000)
		IO.puts "Process 2 finished"
	end)

	raise "Something went wrong"
end)

:timer.sleep(2000)

# 14:34:46.511 [error] Process #PID<0.76.0> raised an exception
# ** (RuntimeError) Something went wrong
#     04-linking-process.ex:7: anonymous fn/0 in :elixir_compiler_0.__FILE__/1