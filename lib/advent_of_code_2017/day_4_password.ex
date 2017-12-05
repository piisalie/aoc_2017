defmodule AdventOfCode2017.Password do
  def count(input, validation_fn \\ &Kernel.==/2) do
    input
    |> String.split("\n", trim: true)
    |> Enum.filter(&(&1 |> parse |> validate(validation_fn)))
    |> length
  end

  defp parse(line) do
    line
    |> String.split(~r/\s+/)
  end

  defp validate([_x], _validation_fn) do
    true
  end
  defp validate([first | rest], validation_fn) do
    rest
    |> Enum.find(&(validation_fn.(first, &1)))
    |> case do
         nil  -> validate(rest, validation_fn)
         _    -> false
       end
  end
end
