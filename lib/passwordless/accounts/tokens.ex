defmodule Passwordless.Accounts.Tokens do
  alias Phoenix.Token
  alias PasswordlessWeb.Endpoint

  @login_request_max_age 60 * 15 # 15 minutes
  @login_request_salt "login request salt"

  def sign_login_request(login_request) do
    Token.sign(Endpoint, @login_request_salt, login_request.id)
  end

  def verify_login_request(token) do
    Token.verify(Endpoint, @login_request_salt, token, max_age: @login_request_max_age)
  end
end
