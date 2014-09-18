defmodule EuruTrans.TupleToDict do
  def convert({}) do
    %{}
  end

  def convert(list) when is_list(list) do
    map = Map.new
    lst = Enum.map list, fn (arg) -> convert(map, arg) end
    merge(map, lst)
  end

  def merge(map, []) do
    map
  end

  def merge(map, [head|tail]) do
    merge Map.merge(map, head), tail
  end

  def convert({key, value}) do
    convert(Map.new, {key, value})
  end

  def convert(dict, {key, value}) do
    Map.put(dict, String.to_atom(to_string(key)), value)
  end
end
