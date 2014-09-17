defmodule EuruTrans.PageView do
  use EuruTrans.Views

  def transcripts do
    {:ok, all_files} = File.ls('transcripts')
    Enum.map all_files -- [".git", ".gitignore"], &teaser/1
  end

  def teaser(name) do
    {:ok, content} = File.read(Path.join('transcripts', name))
    String.slice(content, 0, 100) <> "..."
  end
end
