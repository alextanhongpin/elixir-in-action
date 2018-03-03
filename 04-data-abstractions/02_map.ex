days = Map.new 
  |> Map.put(1, "Sunday")
  |> Map.put(2, "Monday")

IO.inspect days, label: "days"
IO.inspect Map.get(days, 1), label: "day 1"