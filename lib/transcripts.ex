defmodule EuruTrans.Transcripts do
  def all do
    all_files = Path.wildcard("transcripts/*.md")
    Enum.map all_files -- [".git", ".gitignore", "transcripts/README.md"], &talk/1
  end

  def by_id(id) do
    name = "#{id}.md"
    abs_path = Path.join('transcripts', name)
    talk(abs_path)
  end

  def talk(filename) do
    {frontmatter, content} = read_file(filename)

    id = Path.basename(String.replace(filename, ".md", ""))
    teaser = Map.get(frontmatter, :teaser, "")

    %EuruTrans.Talk{ speaker: frontmatter[:speaker],
                     title: frontmatter[:title],
                     text: markdown(content),
                     teaser: teaser,
                     id: id
                   }
  end

  defp read_file(filename) do
    { :ok, content } = File.read(filename)
    { frontmatter, markdown } = EuruTrans.Sashimi.parse(content)
    { EuruTrans.TupleToDict.convert(frontmatter), markdown }
  end

  defp markdown(text) do
    Earmark.to_html(text)
  end
end
