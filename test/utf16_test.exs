defmodule UTF16Test do
  use ExUnit.Case
  doctest UTF16

  test "greets the world" do
    assert UTF16.parse("/Users/jmventura/Downloads/utf16/lib/trace.csv") == 32446
  end
end
