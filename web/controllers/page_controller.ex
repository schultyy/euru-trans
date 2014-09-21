defmodule EuruTrans.PageController do
  use Phoenix.Controller

  def index(conn, _params) do
    render conn, "index"
  end

  def search(conn, params) do
    search_string = params["searchString"]
    result = cond do
      String.length(search_string) == 0 ->
        JSON.encode!(EuruTrans.Transcripts.all)
      true ->
        JSON.encode!(EuruTrans.Transcripts.find(search_string))
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
