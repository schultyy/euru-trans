defmodule EuruTransTupleToDictTest do
  use ExUnit.Case

  test "convert tuple to dict" do
    input = {"foo", "bar"}
    output = %{:foo => "bar"}

    assert EuruTrans.TupleToDict.convert(input) == output
  end
end
