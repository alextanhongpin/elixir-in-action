# 1/0
# ** (ArithmeticError) bad argument in arithmetic expression
#     01-error-types.ex:1: (file)
#     (elixir) lib/code.ex:677: Code.require_file/2

# Module.nonexistent_function
# ** (UndefinedFunctionError) function Module.nonexistent_function/0 is undefined or private
#     (elixir) Module.nonexistent_function()
#     (elixir) lib/code.ex:677: Code.require_file/2

# List.first({1,2,3})
# ** (FunctionClauseError) no function clause matching in List.first/1

#     The following arguments were given to List.first/1:

#         # 1
#         {1, 2, 3}

#     Attempted function clauses (showing 2 out of 2):

#         def first([])
#         def first([head | _])

#     (elixir) lib/list.ex:223: List.first/1
#     (elixir) lib/code.ex:677: Code.require_file/2

# raise("Something went wrong")
# ** (RuntimeError) Something went wrong
#     01-error-types.ex:28: (file)
#     (elixir) lib/code.ex:677: Code.require_file/2

# File.open!("nonexistent_file")
# ** (File.Error) could not open "nonexistent_file": no such file or directory
#     (elixir) lib/file.ex:1317: File.open!/2
#     (elixir) lib/code.ex:677: Code.require_file/2

# spawn(fn -> 
# 	exit("I'm done")
# 	IO.puts("This doesn't happen")
# end)

# throw(:thrown_value)
# ** (throw) :thrown_value
#     01-error-types.ex:43: (file)
#     (elixir) lib/code.ex:677: Code.require_file/2