# SuperviseDatabase

**TODO: Add description**

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `supervise_database` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:supervise_database, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/supervise_database](https://hexdocs.pm/supervise_database).

## Run

```bash
$ iex -S mix

$ Todo.System.start_link()
Starting database server
Starting database worker
Starting database worker
Starting database worker
Starting to-do cache
{:ok, #PID<0.165.0>}

$ Process.whereis(:database_server) |> Process.exit(:kill)
Starting database server
Starting database worker
Starting database worker
Starting database worker

$ Todo.ProcessRegistry.start_link
{:ok, #PID<0.133.0>}

$ Todo.ProcessRegistry.register_name(
  {:database_worker, 1},
  self
)
```