defmodule Passwordless.Accounts.Users do
  alias Passwordless.Accounts.User
  alias Passwordless.Repo

  def change(%User{} = user) do
    User.changeset(user, %{})
  end

  def create(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  def get_by_email(email) do
    Repo.get_by(User, email: email)
  end
end
