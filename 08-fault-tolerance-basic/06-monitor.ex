# monitor_ref = Process.monitor(target_pid)

target_pid = spawn(fn ->
	:timer.sleep(1000)
end)

Process.monitor(target_pid)

receive do
	msg -> IO.inspect msg
end

:timer.sleep(2000)

# {:DOWN, #Reference<0.1470592994.166985729.90065>, :process, #PID<0.76.0>,
#  :normal}