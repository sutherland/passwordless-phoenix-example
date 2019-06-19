defmodule PasswordlessWeb.SessionController do
  use PasswordlessWeb, :controller

  alias Passwordless.Accounts.Sessions

  def delete(conn, _params) do
    with id when not is_nil(id) <- get_session(conn, :session_id),
         session when not is_nil(session) <- Sessions.get(id),
         {:ok, _session} <- Sessions.delete(session)
    do
      log_out(conn)
    else
      nil -> log_out(conn)
    end
  end

  defp log_out(conn) do
    conn
    |> configure_session(drop: true)
    |> redirect(to: Routes.home_path(conn, :index))
  end
end
