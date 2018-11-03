defmodule DiscussWeb.AuthController do
  use DiscussWeb, :controller
  plug Ueberauth
  
  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, params) do
    user_token = auth.credentials.token
    IO.inspect user_token
    IO.inspect params
  end
end
