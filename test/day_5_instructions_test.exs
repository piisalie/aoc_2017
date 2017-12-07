defmodule InstructionsTest do
  use ExUnit.Case, async: true
  alias AdventOfCode2017.Instructions

  test "example input" do
    input =
      ~s"""
      0
      3
      0
      1
      -3
      """
    assert 5 == Instructions.step(input)
  end

  test "star input" do
    input = File.read!("./priv/day_5_input_1.txt")

    assert 394829 == Instructions.step(input)
  end

  test "star two example input" do
    input =
      ~s"""
      0
      3
      0
      1
      -3
      """

    assert 10 == Instructions.super_jump(input)
  end

  @tag timeout: 240000
  test "star two test input" do
    input = File.read!("./priv/day_5_input_1.txt")

    assert 31150702 == Instructions.super_jump(input)
  end
end
