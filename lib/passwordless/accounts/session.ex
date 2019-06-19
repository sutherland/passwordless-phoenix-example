defmodule Passwordless.Accounts.Session do
  use Ecto.Schema

  alias Passwordless.Accounts.User

  schema "sessions" do
    timestamps()

    belongs_to :user, User
  end
end
