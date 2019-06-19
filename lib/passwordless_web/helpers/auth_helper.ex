defmodule PasswordlessWeb.AuthHelper do
  alias Plug.Conn
  alias Passwordless.Accounts.Sessions

  def logged_in?(conn) do
    with session_id when not is_nil(session_id) <- Conn.get_session(conn, :session_id),
         session when not is_nil(session) <- Sessions.get(session_id)
    do
      true
    else
      nil -> false
    end
  end
end
