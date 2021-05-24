file = "./export.bin"

map = %{
  name: "Juan Manuel Ventura",
  age: 46,
  sex: "yes, please!"
}

export = :erlang.term_to_binary(map)

File.write!(file, export)

case File.read(file) do
  {:ok, body} ->
    content = :erlang.binary_to_term(body)
    IO.inspect(content)

  {:error, _reason} ->
    nil
end
