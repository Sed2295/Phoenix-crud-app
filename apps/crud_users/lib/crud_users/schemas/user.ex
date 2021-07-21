defmodule CrudUsers.User do
  #use Ecto.Schema ya nos define este mapa %CrudUsers.User{}
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query
  schema "users" do
    field :name, :string
    field :age, :integer
    field :email, :string
    timestamps()
  end
  #El changeset nos sirve para crear un conjunto de cambios y poder validar y filtrar todos los datos que deseamos insertar
  def signup_changeset(user = %CrudUsers.User{}, params) do
    user
    #cast y params son de Ecto.Changeset
      |> cast(params, [:name, :age, :email])
      |> validate_required([:name, :age, :email])
  end
  def save(changeset) do
    CrudUsers.Repo.insert(changeset)
  end
  def search(user_id) do
    query = from u in CrudUsers.User,
      where: u.id == ^user_id,
      select: u
    CrudUsers.Repo.one(query)
  end
  def search_all do
    query = from u in CrudUsers.User,
      select: u
    CrudUsers.Repo.all(query)
  end
end
#GUARDAR CHANGESET
#chg = CrudUsers.User.signup_changeset(%CrudUsers.User{}, %{name: "Alfredo", age: 25, email: "sed.silver@hotmail.com"})

# GUARDAR EN LA BD UN REGISTRO CON NUESTRO CHANGESET
# CrudUsers.User.save(chg)

# CONSULTAR EN LA BASE DE LA TABLA USER CON ID 2
# CrudUsers.User.search(2)

# CONSULTAR TODOS LOS REGISTROS DE LA TABLA USER SOLO CON NOMBRE
# CrudUsers.User.search_all
