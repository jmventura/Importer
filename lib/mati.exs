IO.puts("come ti chiami?")
name = IO.gets("") |> String.split("\n")
IO.puts("ciao #{name}")

IO.puts("in che anno sei nata?")
[year | _] = IO.gets("") |> String.split("\n")
IO.puts("ciao #{name}, hai #{2021 - String.to_integer(year)} anni")
