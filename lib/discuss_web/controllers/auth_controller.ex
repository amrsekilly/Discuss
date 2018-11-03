defmodule DiscussWeb.AuthController do
  use DiscussWeb, :controller
  plug Ueberauth
  
  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, params) do
    user_params = %{token: auth.credentials.token, email: auth.info.email, username: auth.info.name}
    IO.inspect user_params
    IO.inspect params
  end
end
