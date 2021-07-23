defmodule CrudUsersWeb.PageController do
  use CrudUsersWeb, :controller

  def index(conn, _params) do
    changeset = CrudUsers.User.signup_changeset(%CrudUsers.User{})
    render(conn, "crud.html", changeset: changeset)
  end
end
