defmodule CrudUsersWeb.UserFallBackController do
  #modulo creado para cachar los errores
  use CrudUsersWeb, :controller
  def call(conn, {:error, changeset = %Ecto.Changeset{}}) do
    IO.inspect changeset
      conn
        |> put_status(400)
        |> json(%{errors: "Change Set Errors"})
  end
  def call(conn, {:error, error}) do
    conn
      |> put_status(404)
      |> json(%{error: error})
  end
  def call(conn, _) do
    conn
      |> put_status(500)
      |> json(%{error: "Unhaundled error: please call administrator"})
  end
end
