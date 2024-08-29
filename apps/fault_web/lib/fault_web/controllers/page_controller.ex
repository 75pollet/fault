defmodule FaultWeb.PageController do
  use FaultWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
