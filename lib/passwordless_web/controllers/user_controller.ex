defmodule PasswordlessWeb.UserController do
  use PasswordlessWeb, :controller

  alias Ecto.Changeset
  alias Passwordless.Accounts.User
  alias Passwordless.Accounts.Users

  def new(conn, _params) do
    changeset = Users.change(%User{})

    conn
    |> assign(:changeset, changeset)
    |> render("new.html")
  end

  def create(conn, %{"user" => user_params}) do
    case Users.create(user_params) do
      {:ok, _user} ->
        conn
        |> put_flash(:info, "Signed up successfully.")
        |> redirect(to: Routes.home_path(conn, :index))

      {:error, %Changeset{} = changeset} ->
        conn
        |> assign(:changeset, changeset)
        |> render("new.html")
    end
  end
end
