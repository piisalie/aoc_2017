defmodule AdventOfCode2017.Memory do
  require Integer

  def steps(number) do
    upper_limit   = round(Float.ceil(:math.sqrt(number)))
    ring_position = round(:math.floor(upper_limit / 2))
    top           = round(:math.pow(upper_limit, 2))
    bottom        = round(:math.pow((upper_limit - 2), 2))

    edge_numbers =
      Enum.into((bottom + 1)..top, [])
      |> Enum.chunk(upper_limit - 1)
      |> Enum.find(&(Enum.member?(&1, number)))

    if List.last(edge_numbers) == number do
      length(edge_numbers)
    else
      middle =
        edge_numbers
        |> Enum.at(position(edge_numbers))

      abs(number - middle) + ring_position
    end
  end

  defp position(edge_numbers) do
    if Integer.is_even(length(edge_numbers)) do
      round(length(edge_numbers) / 2) - 1
    else
      round(length(edge_numbers) / 2)
    end
  end
end
