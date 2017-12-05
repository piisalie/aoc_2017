defmodule MemoryTest do
  use ExUnit.Case, async: true
  alias AdventOfCode2017.Memory

  test "square 12" do
    assert 3 == Memory.steps(12)
  end

  test "square 23" do
    assert 2 == Memory.steps(23)
  end

  test "square 1024" do
    assert 31 == Memory.steps(1024)
  end

  test "star 1: 368078" do
    assert 371 == Memory.steps(368078)
  end
 end
