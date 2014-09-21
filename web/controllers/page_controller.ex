defmodule EuruTrans.PageController do
  use Phoenix.Controller

  def index(conn, _params) do
    render conn, "index"
  end

  def search(conn, params) do
    result = case params do
    %{} ->
      JSON.encode!(EuruTrans.Transcripts.all)
    end
    json conn, result
  end

  def not_found(conn, _params) do
    render conn, "not_found"
  end

  def error(conn, _params) do
    render conn, "error"
  end
end
