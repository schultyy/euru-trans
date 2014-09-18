defmodule EuruTrans.Elasticsearch.Queries do
  def match_all do
    %{match_all: {}}
  end
end
