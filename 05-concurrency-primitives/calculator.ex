defmodule Calculator do
  def start do
    initial_state = 0
    spawn(fn -> loop(initial_state) end)
  end

  defp loop(state) do
    new_state = receive do
      {:value, caller} ->
        send(caller, {:response, state})
        state

      {:add, value} -> state + value
      {:sub, value} -> state - value
      {:mul, value} -> state * value
      {:div, value} -> state / value

      invalid_request ->
        IO.puts "Invalid request #{inspect invalid_request}"
        state
    end

    loop(new_state)
  end

  def value(server_pid) do
    send(server_pid, {:value, self()})
    receive do
      {:response, value} -> value
    end
  end

  def add(server_pid, value), do: send(server_pid, {:add, value})
  def sub(server_pid, value), do: send(server_pid, {:sub, value})
  def mul(server_pid, value), do: send(server_pid, {:mul, value})
  def div(server_pid, value), do: send(server_pid, {:div, value})
end