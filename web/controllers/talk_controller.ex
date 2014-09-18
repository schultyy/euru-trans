defmodule EuruTrans.TalkController do
  use Phoenix.Controller

  def index(conn, %{"id" => id}) do
    render conn, "index", talk: EuruTrans.Transcripts.by_id(id)
  end
end
