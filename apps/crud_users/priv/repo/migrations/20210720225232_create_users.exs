defmodule CrudUsers.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    #campos que van a ir en nuestra BD
    create table(:users) do
      add :name, :string
      add :age, :integer
      add :email, :string
      timestamps()
    end
  end
end
