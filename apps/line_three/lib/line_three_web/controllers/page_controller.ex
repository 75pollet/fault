defmodule LineThreeWeb.PageController do
  use LineThreeWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
