defmodule EuruTrans.Transcripts do
  def all do
    EuruTrans.Elasticsearch.start
    {:ok, match_all} = EuruTrans.Elasticsearch.Queries.match_all |> JSON.encode
    EuruTrans.Elasticsearch.post('http://localhost:9200/transcripts/_search', match_all).body
    |> parse
  end

  def find(search_string) do
    EuruTrans.Elasticsearch.start
    {:ok, prefix} = EuruTrans.Elasticsearch.Queries.prefix("title", search_string) |> JSON.encode
    EuruTrans.Elasticsearch.post('http://localhost:9200/transcripts/_search', prefix).body
    |> parse
  end

  def parse(args) do
    Enum.map args, &talk/1
  end

  def by_id(id) do
    {:ok, id_query} = EuruTrans.Elasticsearch.Queries.ids([id]) |> JSON.encode
    EuruTrans.Elasticsearch.start
    EuruTrans.Elasticsearch.post('http://localhost:9200/transcripts/_search', id_query).body
    |> parse
    |> hd
  end

  defp talk(result) do
    source = result["_source"]
    %EuruTrans.Talk{ speaker: source["speaker"],
      title: source["title"],
      text: markdown(source["text"]),
      teaser: source["teaser"],
      id: result["_id"]
    }
  end

  defp markdown(text) do
    Earmark.to_html(text)
  end
end
