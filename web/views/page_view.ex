defmodule EuruTrans.PageView do
  use EuruTrans.Views

  def transcripts do
    teaser('transcripts/rin-raeuber.md')
  end

  def teaser(name) do
    {:ok, content} = File.read(name)
    String.slice(content, 0, 100) <> "..."
  end
end
