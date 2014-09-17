defmodule EuruTrans.Router do
  use Phoenix.Router

  get "/", EuruTrans.PageController, :index, as: :pages

end
