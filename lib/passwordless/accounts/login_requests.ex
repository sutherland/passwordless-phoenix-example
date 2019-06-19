defmodule Passwordless.Accounts.LoginRequests do
  alias Ecto.Multi
  alias Passwordless.Accounts.LoginRequest
  alias Passwordless.Accounts.Tokens
  alias Passwordless.Accounts.Users
  alias Passwordless.Repo

  def create(email) do
    with user when not is_nil(user) <- Users.get_by_email(email) do
      {:ok, changes} =
        Multi.new()
        |> Multi.delete_all(:delete_login_requests, Ecto.assoc(user, :login_request))
        |> Multi.insert(:login_request, Ecto.build_assoc(user, :login_request))
        |> Repo.transaction()

      {:ok, changes, user}
    else
      nil -> {:error, :not_found}
    end
  end

  def redeem(token) do
    with {:ok, id} <- Tokens.verify_login_request(token),
         login_request when not is_nil(login_request) <- Repo.get(LoginRequest, id),
         %{user: user} <- Repo.preload(login_request, :user)
    do
      Multi.new()
      |> Multi.delete_all(:delete_login_requests, Ecto.assoc(user, :login_request))
      |> Multi.insert(:session, Ecto.build_assoc(user, :sessions))
      |> Repo.transaction()
    else
      nil ->
        {:error, :not_found}

      {:error, :expired} ->
        {:error, :expired}
    end
  end
end
