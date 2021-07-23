defmodule CrudUsersWeb.Router do
  use CrudUsersWeb, :router

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

  scope "/", CrudUsersWeb do
    pipe_through :browser
    get "/", PageController, :index
    post "/create_form", UserController, :create_form
  end

  # Other scopes may use custom stacks.
  scope "/api/v1", CrudUsersWeb do
    pipe_through :api
    #Forma 2 de declarar rutas
    resources "/users", UserController, only: [:index, :show, :create]
    #Forma 1 de declarar rutas
    #post "/users", UserController, :create
    #get "/users", UserController, :index
    #get "/users/:id", UserController, :show
  end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser
      live_dashboard "/dashboard", metrics: CrudUsersWeb.Telemetry
    end
  end
end
