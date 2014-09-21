defmodule EuruTrans.ElasticsearchQueryTest do
  use ExUnit.Case

  test "match_all" do
    {:ok, match_all} = JSON.encode(EuruTrans.Elasticsearch.Queries.match_all)
    assert match_all == "{\"query\":{\"match_all\":{}}}"
  end

  test "ids" do
    {:ok, ids} = JSON.encode(EuruTrans.Elasticsearch.Queries.ids(2))
    assert ids == "{\"query\":{\"ids\":{\"values\":[2]}}}"
  end
end
