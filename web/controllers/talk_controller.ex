defmodule EuruTrans.TalkController do
  use Phoenix.Controller

  def index(conn, %{"id" => id}) do
    render conn, "index"
  end
end
