spawn(fn ->
	spawn(fn ->
		:timer.sleep(1000)
		IO.puts "Process 2 finished"
	end)

	raise "Something went wrong"
end)

:timer.sleep(2000)

# 14:13:03.537 [error] Process #PID<0.76.0> raised an exception
# ** (RuntimeError) Something went wrong
#     03-errors-in-concurrent-system.ex:7: anonymous fn/0 in :elixir_compiler_0.__FILE__/1
# Process 2 finished