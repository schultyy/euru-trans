defmodule EuruTrans.Elasticsearch do
  use HTTPotion.Base

  def process_request_headers(headers) do
    Dict.put headers, :"Content-Type", "application/json"
  end

  def process_response_body(body) do
    {:ok, json} = JSON.decode to_string(body)
    json["hits"]["hits"]
  end
end
