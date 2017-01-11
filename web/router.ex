defmodule GraphqlTest.Router do
  use GraphqlTest.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  # pipeline :api do
  #   plug :accepts, ["json"]a
  # end

  forward "/api", Absinthe.Plug,
    schema: GraphqlTest.Schema

 # GraphiQL will only be enabled for dev environmentt
  if Mix.env == :dev do
    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: GraphqlTest.Schema
  end

  scope "/", GraphqlTest do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # # Other scopes may use custom stacks.
  # scope "/api", GraphqlTest do
  #   pipe_through :api
  # end
end
