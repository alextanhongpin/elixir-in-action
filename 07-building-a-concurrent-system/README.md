# Todo

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `todo` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:todo, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/todo](https://hexdocs.pm/todo).

## Starting

```bash
$ iex -S mix

$ Todo.Supervisor.start_link
starting to-do cache
Starting database server.
Starting database worker.
Starting database worker.
Starting database worker.
{:ok, #PID<0.121.0>}

$ bobs_list = Todo.Cache.server_process("Bob's list")
Starting to-do server for name Bob's list
{:ok, #PID<0.128.0>}

$ Todo.Server.entries(bobs_list, {2013, 12, 19})
[]

# Check existing cache
$ Process.whereis(:todo_cache)
#PID<0.121.0>

# Kill worker to watch it restart with a different :todo_cache pid
$ Process.whereis(:todo_cache) |> Process.exit(:kill)
true
starting to-do cache
Starting database server.

$ Process.whereis(:todo_cache)
#PID<0.132.0>

$ bobs_list = Todo.Cache.server_process("Bob's list")
Starting to-do server for name Bob's list
#PID<0.134.0>
```