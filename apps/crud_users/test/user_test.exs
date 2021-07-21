defmodule  CrudUsers.UserTest do
  use CrudUsers.DataCase
  setup do
    user = %CrudUsers.User{}
    user_chg = CrudUsers.User.signup_changeset(user, %{"name" => "Fernando", "age" => 32, "email" => "fernando@gmail.com"})
    stored_usr = CrudUsers.Repo.insert!(user_chg)
    {:ok, user: stored_usr}
  end
  test "create user succesfully" do
    user = %CrudUsers.User{}
    #changeset = CrudUsers.User.signup_changeset(user, %{name: "Fernando", age: 32, email: "fernando@gmail.com"})
    # SEGUNDA FORMA
    changeset = CrudUsers.User.signup_changeset(user, %{"name" => "Fernando", "age" => 32, "email" => "fernando@gmail.com"})
    assert changeset.valid? == true
    {:ok, _} = CrudUsers.User.save changeset
  end
  test "create user unsuccesfully" do
    user = %CrudUsers.User{}
    changeset = CrudUsers.User.signup_changeset(user, %{"name" => "Fernando", "age" => "A", "email" => "fernando@gmail.com"})
    assert changeset.valid? == false
  end
  test "search user succesfully", %{user: user} do
    user = CrudUsers.User.search(user.id)
    IO.inspect user
    assert user.name == "Fernando"
  end
  test "search all users" do
    users = CrudUsers.User.search_all
    assert users != []
  end
end
