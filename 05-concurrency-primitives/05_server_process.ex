Code.load_file("database_server.ex")

server_pid = DatabaseServer.start()

DatabaseServer.run_async(server_pid, "query 1")
IO.inspect DatabaseServer.get_result, label: "Result 1"

DatabaseServer.run_async(server_pid, "query 2")
IO.inspect DatabaseServer.get_result, label: "Result 2"
