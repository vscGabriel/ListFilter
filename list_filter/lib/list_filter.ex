defmodule ListFilter do
  def call(list) do
    IO.inspect(list)

    # converte as strings em valores inteiros
    list =
      Enum.flat_map(list, fn x ->
        case Integer.parse(x) do
          {int, _rest} -> [int]
          :error -> []
        end
      end)

    IO.inspect(list)
    count(Enum.filter(list, fn x -> rem(x, 2) != 0 end), 0)
  end

  defp count([], acc), do: acc

  defp count([_head | tail], acc) do
    acc = acc + 1
    count(tail, acc)
  end
end
