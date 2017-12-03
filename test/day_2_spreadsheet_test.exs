defmodule SpreadsheetTest do
  use ExUnit.Case, async: true
  alias AdventOfCode2017.Spreadsheet

  test "example input" do
    spreadsheet =
      ~s"""
      5 1 9 5
      7 5 3
      2 4 6 8
      """

    assert 18 == Spreadsheet.checksum(spreadsheet)
  end

  test "actual input" do
    {:ok, spreadsheet} = File.read("./priv/day_2_input_1.txt")

    assert 0 == Spreadsheet.checksum(spreadsheet)
  end

  test "part 2 example input" do
    spreadsheet =
      ~s"""
      5 9 2 8
      9 4 7 3
      3 8 6 5
      """

    assert 9 == Spreadsheet.checksum(spreadsheet, &Spreadsheet.divmod/1)
  end

  test "part2 actual input" do
    {:ok, spreadsheet} = File.read("./priv/day_2_input_1.txt")

    assert 0 == Spreadsheet.checksum(spreadsheet, &Spreadsheet.divmod/1)
  end
end
