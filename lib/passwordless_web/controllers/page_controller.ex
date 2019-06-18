defmodule PasswordlessWeb.PageController do
  use PasswordlessWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
