defmodule EuruTrans.ElasticsearchTest do
  use ExUnit.Case

  test "match_all returns dict" do
    assert EuruTrans.Elasticsearch.match_all == %{match_all: {}}
  end
end
