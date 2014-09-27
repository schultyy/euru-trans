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

  def prefix(property, value) do
    prefix_list = Map.put_new(Map.new, property, value)
    [query: %{
        prefix: prefix_list
      }
    ]
  end

  def multi_match(properties, value) do
    [query: %{
        multi_match: %{
        fields: properties,
        query: value
      }
    }]
  end
end
