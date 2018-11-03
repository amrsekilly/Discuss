defmodule DiscussWeb.AuthController do
  use DiscussWeb, :controller
  plug Ueberauth
  
  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, %{"provider" => provider} = params) do
    user_params = %{token: auth.credentials.token, email: auth.info.email, username: auth.info.name, provider: provider}

    IO.inspect "----------------------"
    IO.inspect user_params
    IO.inspect "----------------------"
    IO.inspect params
    IO.inspect "----------------------"

  end
end
