defmodule Passwordless.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias Passwordless.Accounts.LoginRequest
  alias Passwordless.Accounts.Session

  schema "users" do
    field :email, :string

    timestamps()

    has_one :login_request, LoginRequest
    has_many :sessions, Session
  end

  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email])
    |> validate_required([:email])
    |> unique_constraint(:email)
  end
end
