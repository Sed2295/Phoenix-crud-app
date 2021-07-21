defmodule CrudUsersWeb.UserView do
  #vista creada para el manejon de erroes en el archivo  user_controller en la linea 15
  use CrudUsersWeb, :view
  alias CrudUsersWeb.UserView

  def transalate_errors(changeset) do
    Ecto.Changeset.traverse_errors(changeset, &translate_error/1)
  end
  def render("error.json", %{changeset: changeset}) do
    %{errors: transalate_errors(changeset)}
  end
  #vista creada para visualizar los json
  def render("single_user.json", %{user: user}) do
    %{
      name: user.name,
      age: user.age,
      email: user.email,
      id: user.id
    }
  end
  #vista creada para visualizar a todos los usuarios de la bd
  def render("users.json", %{users: users}) do
    %{users: render_many(users, UserView, "single_user.json")}
  end
end
