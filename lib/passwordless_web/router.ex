defmodule PasswordlessWeb.Router do
  use PasswordlessWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  if Mix.env == :dev do
    forward "/sent-emails", Bamboo.SentEmailViewerPlug
  end

  scope "/", PasswordlessWeb do
    pipe_through :browser

    get "/", HomeController, :index
    resources "/users", UserController, only: [:create, :new]
    resources "/login-requests", LoginRequestController, only: [:create, :new, :show], param: "token"
  end

  # Other scopes may use custom stacks.
  # scope "/api", PasswordlessWeb do
  #   pipe_through :api
  # end
end
