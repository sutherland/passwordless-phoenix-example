defmodule PasswordlessWeb.LoginRequestController do
  use PasswordlessWeb, :controller

  alias Passwordless.Accounts.LoginRequests

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"login_request" => %{"email" => email}}) do
    case LoginRequests.create(email) do
      {:ok, _changes, _user} ->
        conn
        |> put_flash(:info, "We just emailed you a temporary login link. Please check your inbox.")
        |> redirect(to: Routes.home_path(conn, :index))

      {:error, :not_found} ->
        conn
        |> put_flash(:error, "Oops, that email does not exist.")
        |> render("new.html")
    end
  end
end
