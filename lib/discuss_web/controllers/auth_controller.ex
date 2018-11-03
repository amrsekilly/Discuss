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
    |> signin(conn)

  end

  defp signin(changeset, conn) do
    case insert_update_user(changeset) do
      {:error, _} -> 
        conn
        |> put_flash(:error, "Something went wrong signing in!")
        |> redirect(to: topic_path(conn, :index))
      
      {:ok, user} -> 
        conn
        |> put_flash(:info, "Welcome back, #{user.username}")
        |> put_session(:user_id, user.id)
        |> redirect(to: topic_path(conn, :index))        
    end
  end

  defp insert_update_user(%{changes: %{email: email}} = changeset) do
    case Repo.get_by(User, email: email) do
      nil -> Repo.insert(changeset)
      user -> {:ok, user}
    end
  end
end
