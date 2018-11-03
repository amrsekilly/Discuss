defmodule DiscussWeb.AuthController do
  use DiscussWeb, :controller
  plug Ueberauth
  
  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, params) do
    IO.inspect auth
    IO.inspect params
  end
end
