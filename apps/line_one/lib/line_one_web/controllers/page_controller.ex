defmodule LineOneWeb.PageController do
  use LineOneWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
