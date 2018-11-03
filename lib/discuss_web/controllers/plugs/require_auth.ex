defmodule Discuss.Plugs.RequireAuth do
  import Plug.Conn
  import Phoenix.Controller
  alias DiscussWeb.Router.Helpers

  def init(_) do end

  def call(conn, _) do
    cond do
      conn.assigns[:user] -> conn
      true -> 
        conn
        |> put_flash(:error, "You must be signed in!")
        |> redirect(to: Helpers.topic_path(conn, :index))
        |> halt
    end
  end

end