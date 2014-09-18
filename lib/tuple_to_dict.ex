defmodule EuruTrans.TupleToDict do
  def convert({key, value}) do
    Map.put(Map.new, String.to_atom(key), value)
  end
end
