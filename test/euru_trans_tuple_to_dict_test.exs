defmodule EuruTransTupleToDictTest do
  use ExUnit.Case

  test "convert tuple to dict" do
    input = {"foo", "bar"}
    output = %{:foo => "bar"}

    assert EuruTrans.TupleToDict.convert(input) == output
  end

  test "convert empty" do
    assert EuruTrans.TupleToDict.convert({}) == %{}
  end

  test "convert list of tuples" do
    input = [{"title", "Accessibility"}, {"speaker", "Austin Serafin"}]
    output = %{
      :title => "Accessibility",
      :speaker => "Austin Serafin"
    }
    assert EuruTrans.TupleToDict.convert(input) == output
  end
end
