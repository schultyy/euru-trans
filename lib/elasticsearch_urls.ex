defmodule EuruTrans.Elasticsearch.Urls do
  def url_with_index(index) do
    "http://localhost:9200/#{index}"
  end
end
