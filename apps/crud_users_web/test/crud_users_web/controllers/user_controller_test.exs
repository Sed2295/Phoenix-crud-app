#Modulo para probar la aplicacion web con http
defmodule CrudUsersWeb.UserControllerTest do
  #use CrudUsersWeb.ConnCase nos sirve para usar conexion dentro de las pruebas
  use CrudUsersWeb.ConnCase
  setup do
    user = %CrudUsers.User{}
    user_chg = CrudUsers.User.signup_changeset(user, %{"name" => "Fernando", "age" => 32, "email" => "fernando@gmail.com"})
    stored_usr = CrudUsers.Repo.insert!(user_chg)
    {:ok, user: stored_usr}
  end

  test "user creation successfully" do
    conn = build_conn()
      |> put_req_header("content-type", "application/json")
      |> post("api/v1/users", IO.inspect create_user_request())
    conn
      |> response(201)
  end
  test "Find user test", %{user: user} do
    IO.inspect user
    conn = build_conn()
      |> get("/api/v1/users/#{user.id}")
    conn
      |> response(200)
  end

  def create_user_request do
    #Hacemos uso de sigil para escapar los espacios ~
    ~s({
      "user": {
          "name": "test desde codigo",
          "email": "test@hotmail.com",
          "age": 55
      }
    })
  end
end
