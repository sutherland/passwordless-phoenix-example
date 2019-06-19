defmodule Passwordless.Accounts.LoginRequest do
  use Ecto.Schema

  alias Passwordless.Accounts.User

  schema "login_requests" do
    timestamps()

    belongs_to :user, User
  end
end
