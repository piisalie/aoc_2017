defmodule AdventOfCode2017.Debugger do
  def count_cycles(input) do
    input
    |> String.trim
    |> String.split(~r/\t/)
    |> Enum.map(&String.to_integer/1)
    |> level(0, [])
  end

  defp level(banks, cycle_count, history) do
    if Enum.member?(history, banks) do
      {Enum.find_index(history, &(&1 == banks)) + 1, cycle_count}
    else
      {max, position} =
        banks
        |> Enum.with_index
        |> Enum.max_by(fn {v, _i} -> v end)

      result =
        banks
        |> List.replace_at(position, 0)
        |> distribute(position + 1, max)

      level(result, cycle_count + 1, [banks | history])
    end
  end

  defp distribute(banks, _position, 0) do
    banks
  end
  defp distribute(banks, position, blocks) when (position + 1) > length(banks) do
    value = Enum.at(banks, 0)

    banks
    |> List.replace_at(0, value + 1)
    |> distribute(1, blocks - 1)
  end
  defp distribute(banks, position, blocks) do
    value = Enum.at(banks, position)

    banks
    |> List.replace_at(position, value + 1)
    |> distribute(position + 1, blocks - 1)
  end
end

