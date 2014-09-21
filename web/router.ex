defmodule EuruTrans.Router do
  use Phoenix.Router

  get "/", EuruTrans.PageController, :index, as: :pages
  post "/search", EuruTrans.PageController, :search
  get "/talks/:id", EuruTrans.TalkController, :index

end
