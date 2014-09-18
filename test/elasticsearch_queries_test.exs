defmodule EuruTrans.ElasticsearchQueryTest do
  use ExUnit.Case

  test "match_all returns dict" do
    assert EuruTrans.Elasticsearch.Queries.match_all == %{match_all: {}}
  end
end
