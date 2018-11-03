defmodule DiscussWeb.AuthController do
  use DiscussWeb, :controller
  alias Discuss.Users.User
  alias Discuss.Repo
  plug Ueberauth
  
  def callback(%{assigns: %{ueberauth_auth: auth}} = conn, %{"provider" => provider} = params) do
    user_params = %{
      token: auth.credentials.token, 
      email: auth.info.email, 
      username: auth.info.name,
      provider: provider
    }

    User.changeset(%User{}, user_params) 
    |> insert_update_user

  end

  defp insert_update_user(%{changes: %{email: email}} = changeset) do
    case Repo.get_by(User, email: email) do
      nil -> Repo.insert(changeset)
      user -> {:ok, user}
    end
  end
end
