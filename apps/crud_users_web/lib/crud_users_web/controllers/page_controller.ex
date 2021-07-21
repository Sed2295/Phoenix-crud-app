defmodule CrudUsersWeb.PageController do
  use CrudUsersWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
