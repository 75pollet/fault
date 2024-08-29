defmodule LineTwoWeb.PageController do
  use LineTwoWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
