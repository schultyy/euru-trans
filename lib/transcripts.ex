defmodule EuruTrans.Transcripts do
  def all do
    all_files = Path.wildcard("transcripts/*.html")
    Enum.map all_files -- [".git", ".gitignore"], &teaser/1
  end

  def by_id(id) do
    name = "#{id}.html"
    {:ok, content} = File.read(Path.join('transcripts', name))
    talk(name)
  end

  def talk(name) do
    {:ok, content} = File.read(Path.join('transcripts', name))
    id = String.replace(name, ".html", "")
    %EuruTrans.Talk{speaker: "Franz", title: "Banane", text: content, id: id}
  end

  def teaser(name) do
    complete_talk = talk(name)
    text = String.slice(complete_talk.text, 0, 100) <> "..."
    %EuruTrans.Talk{speaker: complete_talk.speaker,
    title: complete_talk.title,
    text: text,
    id: complete_talk.id}
  end
end
