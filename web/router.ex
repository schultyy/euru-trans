defmodule EuruTrans.Router do
  use Phoenix.Router

  get "/", EuruTrans.PageController, :index, as: :pages
  get "/talks/:id", EuruTrans.TalkController, :index

end
