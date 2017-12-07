defmodule DebuggerTest do
  use ExUnit.Case, async: true
  alias AdventOfCode2017.Debugger

  test "example case" do
    input = "0	2	7	0"

    assert {4, 5} == Debugger.count_cycles(input)
  end

  test "first star" do
    input = File.read!("priv/day_6_input_1.txt")
    assert {1086, 5042} == Debugger.count_cycles(input)
  end
end
