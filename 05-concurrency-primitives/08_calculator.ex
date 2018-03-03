Code.load_file("calculator.ex")

server_pid = Calculator.start
IO.inspect Calculator.value(server_pid), label: "Initial value"

Calculator.add(server_pid, 3)
Calculator.mul(server_pid, 2)
Calculator.div(server_pid, 4)
Calculator.sub(server_pid, 5)

IO.inspect Calculator.value(server_pid), label: "Final value"
