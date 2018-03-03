Code.load_file("fraction.ex")

one_half = Fraction.new(1, 2)
IO.inspect one_half, label: "one half"

Fraction.new(1, 4)
|> IO.inspect
|> Fraction.add(Fraction.new(1, 2))
|> IO.inspect
|> Fraction.add(Fraction.new(1, 2))
|> IO.inspect
|> Fraction.value
|> IO.inspect
