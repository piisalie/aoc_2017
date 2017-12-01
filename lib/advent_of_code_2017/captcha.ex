defmodule AdventOfCode2017.CaptchaServer do
  use GenServer

  def start_link(opts) do
    GenServer.start_link(__MODULE__, [], opts)
  end

  def found_match(server, number) do
    GenServer.call(server, {:found_match, number})
  end

  def sum(server) do
    GenServer.call(server, {:sum})
  end

  def handle_call({:found_match, number}, _from, state) do
    {:reply, :ok, [number | state]}
  end

  def handle_call({:sum}, _from, state) do
    {:reply, Enum.reduce(state, 0, &Kernel.+/2), state}
  end
end

defmodule AdventOfCode2017.Captcha do
  alias AdventOfCode2017.CaptchaServer

  def sum2(input) do
    list =
      input
      |> String.split("")
      |> Enum.filter(&(&1 != ""))
      |> Enum.map(&String.to_integer/1)

    distance = round(Enum.count(list) / 2)
    wrap = list ++ list

    {:ok, server} = CaptchaServer.start_link([])

    list
    |> Enum.with_index
    |> Enum.each(fn {elm, idx} ->
      if elm == Enum.at(wrap, (idx + distance)) do
        CaptchaServer.found_match(server, elm)
      end
    end)

    CaptchaServer.sum(server)
  end

  def sum(input) do
    parsed =
      input
      |> String.split("")
      |> Enum.filter(&(&1 != ""))
      |> the_first_shall_be_last
      |> Enum.map(&String.to_integer/1)

    {:ok, server} = CaptchaServer.start_link([])

    traverse(parsed, server)
  end

  defp the_first_shall_be_last([a | _rest] = list) do
    list ++ [a]
  end

  defp traverse([a, a | rest], server) do
    CaptchaServer.found_match(server, a)
    traverse([a | rest], server)
  end
  defp traverse([_a, b | rest], server) do
    traverse([b | rest], server)
  end
  defp traverse([_a], server) do
    CaptchaServer.sum(server)
  end
end
