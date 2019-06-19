defmodule Passwordless.Accounts.Sessions do
  alias Passwordless.Accounts.Session
  alias Passwordless.Repo

  def get(id) do
    Repo.get(Session, id)
  end
end
