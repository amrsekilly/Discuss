defmodule DiscussWeb.Router do
  use DiscussWeb, :router

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

  scope "/topics", DiscussWeb do
    pipe_through :browser # Use the default browser stack

    get "/", TopicController, :index
    get "/new", TopicController, :new
    post "/", TopicController, :create
    get "/:id/edit", TopicController, :edit
    put "/:id", TopicController, :update
    delete "/:id", TopicController, :delete
  end

  # Other scopes may use custom stacks.
  # scope "/api", DiscussWeb do
  #   pipe_through :api
  # end
end
