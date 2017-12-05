defmodule PasswordTest do
  use ExUnit.Case, async: true
  alias AdventOfCode2017.Password

  test "example input" do
    input =
      ~s"""
      aa bb cc dd ee
      aa bb cc dd aa
      aa bb cc dd aaa
      """

    assert 2 == Password.count(input)
  end

  test "first input" do
    input = File.read!("./priv/day_4_input_1.txt")

    assert 455 == Password.count(input)
  end

  test "second star" do
    input      = File.read!("./priv/day_4_input_1.txt")
    validation = fn (word_1, word_2) ->
      word_1
      |> String.graphemes
      |> Enum.sort == word_2
      |> String.graphemes
      |> Enum.sort
    end

    assert 186 == Password.count(input, validation)
  end
end
