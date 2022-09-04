defmodule TodoMvcWeb.PageController do
  use TodoMvcWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
