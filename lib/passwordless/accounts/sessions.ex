defmodule Passwordless.Accounts.Sessions do
  alias Passwordless.Accounts.Session
  alias Passwordless.Repo

  def get(id) do
    Repo.get(Session, id)
  end

  def delete(session) do
    Repo.delete(session)
  end
end
