defmodule EuruTrans.Transcripts do
  def all do
    all_files = Path.wildcard("transcripts/*.md")
    Enum.map all_files -- [".git", ".gitignore", "transcripts/README.md"], &teaser/1
  end

  def by_id(id) do
    name = "#{id}.md"
    abs_path = Path.join('transcripts', name)
    {:ok, content} = File.read(abs_path)
    talk(abs_path)
  end

  def talk(filename) do
    {:ok, content} = File.read(filename)
    id = Path.basename(String.replace(filename, ".md", ""))
    %EuruTrans.Talk{speaker: "Franz", title: "Banane", text: markdown(content), id: id}
  end

  def teaser(name) do
    complete_talk = talk(name)
    text = String.slice(complete_talk.text, 0, 100) <> "..."
    %EuruTrans.Talk{speaker: complete_talk.speaker,
    title: complete_talk.title,
    text: markdown(text),
    id: complete_talk.id}
  end

  defp markdown(text) do
    Earmark.to_html(text)
  end
end
