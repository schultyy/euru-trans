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

  def match(property, value) do
    match_list = Map.put_new(Map.new, property, value)
    [query: %{
        match: match_list
      }
    ]
  end
end
