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

  test "match" do
    {:ok, match} = JSON.encode(EuruTrans.Elasticsearch.Queries.match("foo", "bar"))
    assert match == "{\"query\":{\"match\":{\"foo\":\"bar\"}}}"
  end

  test "prefix" do
    {:ok, prefix} = JSON.encode(EuruTrans.Elasticsearch.Queries.prefix("foo", "bar"))
    assert prefix == "{\"query\":{\"prefix\":{\"foo\":\"bar\"}}}"
  end
end
