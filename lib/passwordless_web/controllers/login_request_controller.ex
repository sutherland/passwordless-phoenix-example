defmodule PasswordlessWeb.LoginRequestController do
  use PasswordlessWeb, :controller

  alias Passwordless.Accounts.LoginRequests
  alias Passwordless.Email
  alias Passwordless.Mailer

  def new(conn, _params) do
    render(conn, "new.html")
  end

  def create(conn, %{"login_request" => %{"email" => email}}) do
    case LoginRequests.create(email) do
      {:ok, %{login_request: login_request}, user} ->
        user
        |> Email.login_request(login_request)
        |> Mailer.deliver_now()

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
