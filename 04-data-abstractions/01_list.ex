list = []
list = List.insert_at(list, -1, :a)
list = List.insert_at(list, -1, :b)
list = List.insert_at(list, -1, :c)

IO.inspect list, label: "list"