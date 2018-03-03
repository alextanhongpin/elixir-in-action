Code.load_file("stateful_database_server.ex")

server_pid = DatabaseServer.start
DatabaseServer.run_async(server_pid, "hello world")
IO.inspect DatabaseServer.get_result