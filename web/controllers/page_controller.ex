defmodule EuruTrans.PageController do
  use Phoenix.Controller

  def index(conn, _params) do
    render conn, "index", talks: transcripts
  end

  def not_found(conn, _params) do
    render conn, "not_found"
  end

  def error(conn, _params) do
    render conn, "error"
  end

  defp transcripts do
    {:ok, all_files} = File.ls('transcripts')
    Enum.map all_files -- [".git", ".gitignore"], &teaser/1
  end

  defp teaser(name) do
    {:ok, content} = File.read(Path.join('transcripts', name))
    text = String.slice(content, 0, 100) <> "..."
    id = String.replace(name, ".md", "")
    %EuruTrans.Talk{speaker: "Franz", title: "Banane", text: text, id: id}
  end
end
