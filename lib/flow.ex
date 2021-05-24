defmodule Importer do
  alias Importer.Constants

  @line_delimiter Constants.line_delimiter()
  @field_delimiter Constants.field_delimiter()
  @headers Constants.headers()
  @xml_fields Constants.xml_fields()

  @spec parse(binary(), atom()) :: {Time.t(), integer()}
  def parse(file \\ "converted.txt", format \\ :native) do
    {time, result} = :timer.tc(fn -> do_parse(file, format) end)

    {Time.from_seconds_after_midnight(div(time, 1_000_000), {rem(time, 1_000_000), 3}), result}
  end

  defp do_parse(file, format) do
    file
    |> File.stream!(read_ahead: 1_000_000)
    |> Stream.transform("", &to_line/2)
    |> Enum.take(10)
    |> Flow.from_enumerable()
    |> Flow.map(&to_map/1)
    |> Flow.map(&serialize(&1, format))
    |> Enum.count()
  end

  defp to_line(chunk, rest) do
    [last_line | lines] =
      (rest <> chunk)
      |> String.split(@line_delimiter)
      |> Enum.reverse()

    {Enum.reverse(lines), last_line}
  end

  defp to_map(line) do
    @headers
    |> Enum.zip(String.split(line, @field_delimiter))
    |> Enum.filter(fn {_k, v} -> v != "" end)
    |> Enum.map(&xml/1)
    |> Enum.into(%{})
  end

  defp xml({k, v}) do
    if Enum.member?(@xml_fields, k) do
      {:ok, {_tag, attributes, _content}, _tail} = :erlsom.simple_form(v)

      {k,
       attributes
       |> Enum.map(fn {k, v} -> {List.to_atom(k), List.to_string(v)} end)
       |> Enum.into(%{})}
    else
      {k, v}
    end
  end

  defp serialize(map, :json) do
    Poison.encode!(map)
  end

  defp serialize(map, :native) do
    IO.inspect(map)
    :erlang.term_to_binary(map)
  end

  @spec convert(binary, binary) :: {:error, binary} | {:ok, binary}
  def convert(source, destination \\ "converted.txt") do
    if File.exists?(source) do
      do_convert(source, destination)
    else
      {:error, "no such source file #{source}"}
    end
  end

  defp do_convert(source, destination) do
    case System.cmd("bash", ["-c", "iconv -f UTF-16LE -t UTF-8 #{source} > #{destination}"]) do
      {"", 0} ->
        {:ok, Path.absname(destination)}

      {_, reason} ->
        {:error, reason}
    end
  end
end
