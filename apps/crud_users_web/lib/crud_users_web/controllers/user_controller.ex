defmodule CrudUsersWeb.UserController do
  use CrudUsersWeb, :controller
  alias CrudUsers.User
  #Controlador que atrapa o maneja errores
  action_fallback CrudUsersWeb.UserFallBackController
  def create(conn, %{"user" => user_params}) do
    chg = User.signup_changeset(%User{}, user_params)
    case chg.valid? do
      true ->
        {:ok, user} = User.save(chg)
        conn
          |> put_status(201)
          #Forma 2 con uso de vistas (view)
          |> render("single_user.json", %{user: user})
          #Forma 1 con json
          #|> json(%{user: %{name: user.name, age: user.age, email: user.email}})
      false ->
        conn
          |> put_status(400)
          |> render("error.json", changeset: chg)
          #|> json(%{error: "Error al crear el usuario"})
    end
  end
  def index(conn, _params) do
    users = User.search_all
    IO.inspect users
    if users do
      conn
        |> put_status(200)
        |> render("users.json", %{users: users})
        #|> json(%{users_active: [users]})
    else
      conn
        |> put_status(400)
        |> json(%{ok: false, msg: "Error en la peticion"})
    end
  end
  def show(conn, %{"id" => id}) do
    user = User.search(id)
    IO.inspect user
    if user do
      conn
        |> put_status(200)
        |> json(%{user: %{name: user.name, age: user.age, email: user.email}})
    else
      conn
        |> put_status(404)
        |> json(%{ok: false, msg: "Usuario no encontrado"})
    end
  end
end
