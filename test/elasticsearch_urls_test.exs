defmodule EuruTrans.Elasticsearch.Urls.Test do
  use ExUnit.Case

  test "generate localhost url with index" do
    assert EuruTrans.Elasticsearch.Urls.url_with_index("test") == "http://localhost:9200/test"
  end
end

