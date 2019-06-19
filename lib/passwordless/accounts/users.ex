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
end
