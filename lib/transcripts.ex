defmodule EuruTrans.Transcripts do
  def all do
    {:ok, all_files} = File.ls('transcripts')
    Enum.map all_files -- [".git", ".gitignore"], &teaser/1
  end

  def by_id(id) do
    name = "#{id}.md"
    {:ok, content} = File.read(Path.join('transcripts', name))
    talk(name)
  end

  def talk(name) do
    {:ok, content} = File.read(Path.join('transcripts', name))
    id = String.replace(name, ".md", "")
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
