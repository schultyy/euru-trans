defmodule EuruTrans.PageView do
  use EuruTrans.Views
  def link_to(talk) do
    "/talks/#{talk.id}"
  end
end
