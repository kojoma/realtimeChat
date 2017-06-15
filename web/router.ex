defmodule RealtimeChat.Router do
  use RealtimeChat.Web, :router

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

  scope "/", RealtimeChat do
    pipe_through :browser # Use the default browser stack

    # Lobby
    get "/", PageController, :index

    # Room
    resources "/rooms", RoomController
  end

  # Other scopes may use custom stacks.
  # scope "/api", RealtimeChat do
  #   pipe_through :api
  # end
end
