defmodule EuruTrans.Elasticsearch do
  #use HTTPotion.Base
  def post_query(url, query) do
    HTTPotion.start
    HTTPotion.post url, query
  end
end
