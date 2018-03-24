spawn(fn -> 
	Process.flag(:trap_exit, true)
	spawn_link(fn -> raise("Something went wrong") end)

	receive do
		msg -> IO.inspect msg
	end
end)

:timer.sleep(2000)

# 14:39:02.642 [error] Process #PID<0.77.0> raised an exception
# ** (RuntimeError) Something went wrong
#     05-trapping-exits.ex:3: anonymous fn/0 in :elixir_compiler_0.__FILE__/1
# {:EXIT, #PID<0.77.0>,
#  {%RuntimeError{message: "Something went wrong"},
#   [
#     {:elixir_compiler_0, :"-__FILE__/1-fun-0-", 0,
#      [file: '05-trapping-exits.ex', line: 3]}
#   ]}}