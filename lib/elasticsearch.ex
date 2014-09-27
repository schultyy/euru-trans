defmodule EuruTrans.Elasticsearch do
  use HTTPotion.Base

  defp query_url do
    'http://localhost:9200/transcripts/_search'
  end

  def process_request_headers(headers) do
    Dict.put headers, :"Content-Type", "application/json"
  end

  def process_response_body(body) do
    {:ok, json} = JSON.decode to_string(body)
    json["hits"]["hits"]
  end

  def query(query) do
    start
    post(query_url, query)
  end
end
