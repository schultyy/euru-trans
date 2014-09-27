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

  test "multi_match" do
    multi_match_query = EuruTrans.Elasticsearch.Queries.multi_match(["title", "body"], "foo")
    match = Dict.get(Dict.get(multi_match_query, :query), :multi_match)
    assert Dict.get(match, :query) == "foo"
    assert Dict.get(match, :fields) == ["title", "body"]
  end
end
