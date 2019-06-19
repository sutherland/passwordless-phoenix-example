defmodule Passwordless.Email do
  use Bamboo.Phoenix, view: PasswordlessWeb.EmailView
  import Bamboo.Email

  alias Passwordless.Accounts.Tokens

  def login_request(user, login_request) do
    new_email()
    |> to(user.email)
    |> from("support@example.com")
    |> subject("Log in to Passwordless")
    |> assign(:token, Tokens.sign_login_request(login_request))
    |> render("login_request.html")
  end
end
