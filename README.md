# elixir-in-action
Examples from the book Elixir in Action

## Glossary

- *call* is the term used for synchronous requests.
- *cast* is the term used for asynchronous requests.
- *OTP* stands for Open Telekom Platform.
- *behaviour* is generic code that implements a common pattern, e.g. `gen_server`, `supervisor`.

## GenServer

- `GenServer.start/2` takes two parameters - the first is the module, and the second is the custom parameter that is passed to the process during initialization. It returns the result as `{:ok, pid}`.
- `init/1` accepts one argument. This is the second argument that is provided to `GenServer.start/2`. It returns the result as `{:ok, initial_state}`.
- `handle_cast/2` accepts the request and state and returns the result as `{:noreply, new_state}`.
- `handle_call/3` takes the request, the caller information and the state. It returns the result as `{:reply, response, new_state}`.

