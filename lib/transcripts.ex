defmodule EuruTrans.Transcripts do
  def all do
    EuruTrans.Elasticsearch.start
    {:ok, match_all} = EuruTrans.Elasticsearch.Queries.match_all |> JSON.encode
    EuruTrans.Elasticsearch.query(match_all).body
    |> parse
  end

  def find(search_string) do
    EuruTrans.Elasticsearch.start
    {:ok, prefix} = EuruTrans.Elasticsearch.Queries.multi_match(["title", "speaker", "text"], search_string) |> JSON.encode
    EuruTrans.Elasticsearch.query(prefix).body
    |> parse
  end

  def parse(args) do
    Enum.map args, &talk/1
  end

  def by_id(id) do
    {:ok, id_query} = EuruTrans.Elasticsearch.Queries.ids([id]) |> JSON.encode
    EuruTrans.Elasticsearch.start
    EuruTrans.Elasticsearch.query(id_query).body
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
