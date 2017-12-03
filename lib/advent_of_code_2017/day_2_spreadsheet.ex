defmodule AdventOfCode2017.Spreadsheet do
  def checksum(input, line_fn \\ &subtract/1) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_line/1)
    |> Enum.map(line_fn)
    |> Enum.reduce(0, &Kernel.+/2)
  end

  defp parse_line(line) do
    line
    |> String.split(~r/\s+/)
    |> Enum.map(&String.to_integer/1)
  end

  def subtract(line) do
    line
    |> Enum.min_max
    |> difference
  end

  defp difference({min, max}) do
    max - min
  end

  def divmod(line) do
    line
    |> Enum.sort(&(&1 >= &2))
    |> handle_line
  end

  defp handle_line([x | rest]) do
    rest
    |> Enum.map(&(Float.ratio((x / &1))))
    |> Enum.filter(&(elem(&1, 1) == 1))
    |> case do
         [{result, 1}] -> result
         []            -> handle_line(rest)
       end
  end
end
