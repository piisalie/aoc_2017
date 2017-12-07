defmodule AdventOfCode2017.Instructions do
  def super_jump(input) do
    input
    |> parse
    |> do_jump(0, 0)
  end

  def step(input) do
    input
    |> parse
    |> do_steps(0, 0)
  end

  defp parse(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&(Integer.parse(&1) |> elem(0)))
  end

  defp do_steps(steps, position, counter) when position >= length(steps) do
    counter
  end
  defp do_steps(steps, position, counter) do
    value = steps |> Enum.at(position)

    steps
    |> List.replace_at(position, value + 1)
    |> do_steps(position + value, counter + 1)
  end

  defp do_jump(steps, position, counter) when position >= length(steps) do
    counter
  end
  defp do_jump(steps, position, counter) do
    value = steps |> Enum.at(position)
    if value >= 3 do
      steps
      |> List.replace_at(position, value - 1)
      |> do_jump(position + value, counter + 1)
    else
      steps
      |> List.replace_at(position, value + 1)
      |> do_jump(position + value, counter + 1)
    end
  end
end
