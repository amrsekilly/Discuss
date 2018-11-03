defmodule DiscussWeb.AuthController do
  use DiscussWeb, :controller
  alias Discuss.Users.User
  plug Ueberauth
  
  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, %{"provider" => provider} = params) do
    user_params = %{
      token: auth.credentials.token, 
      email: auth.info.email, 
      username: auth.info.name,
      provider: provider
    }

    changeset = User.changeset(%User{}, user_params) 

    IO.inspect "--------------"
    IO.inspect changeset
    IO.inspect "--------------"

  end
end
