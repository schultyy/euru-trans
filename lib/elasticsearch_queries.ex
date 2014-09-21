defmodule EuruTrans.Elasticsearch.Queries do
  def match_all do
    [query: %{match_all: %{}}]
  end

  def ids(id_list) do
    [query: %{
        ids: %{
          values: [id_list]
        }
      }]
  end
end
