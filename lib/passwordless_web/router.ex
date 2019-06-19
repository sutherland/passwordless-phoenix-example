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

  scope "/", PasswordlessWeb do
    pipe_through :browser

    get "/", HomeController, :index
    resources "/users", UserController, only: [:create, :new]
  end

  # Other scopes may use custom stacks.
  # scope "/api", PasswordlessWeb do
  #   pipe_through :api
  # end
end
