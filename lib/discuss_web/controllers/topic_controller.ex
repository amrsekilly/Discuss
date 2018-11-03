defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller
  alias Discuss.Topics.Topic
  alias Discuss.Repo

  plug Discuss.Plugs.RequireAuth when action in [:new, :create, :edit, :update, :delete]

  def new(conn, _params) do
    changeset = Topic.changeset(%Topic{}, %{})

    render conn, "new.html", changeset: changeset
  end

  def edit(conn, %{"id" => id}) do
    # render conn, "edit.html", id: id
    topic = Repo.get(Topic, id)
    changeset = Topic.changeset(topic)
    render conn, "edit.html", changeset: changeset, topic: topic
  end

  def update(conn, %{"id" => id, "topic" => topic}) do
    old_topic = Repo.get(Topic, id)
    changeset = Topic.changeset(old_topic, topic)

    case Repo.update(changeset) do
      {:ok, _topic} ->
        conn
        |> put_flash(:info, "Topic was updated properly!")
        |> redirect(to: topic_path(conn, :index))
      {:error, changeset} -> render conn, "edit.html", changeset: changeset, topic: old_topic
    end

  end

  def delete(conn, %{"id" => id} = params) do
    Repo.get!(Topic, id) |> Repo.delete! 
      conn
      |> put_flash(:info, "Topic was deleted successfully!!")
      |> redirect(to: topic_path(conn, :index))
  end

  def index(conn, _params) do
    topics = Repo.all(Topic)
    render conn, "index.html", topics: topics
  end

  def create(conn, %{"topic" => topic}) do
    # changeset = Topic.changeset(%Topic{}, topic)
    changeset = conn.assigns[:user]
    |> Ecto.build_assoc(:topics)
    |> Topic.changeset(topic)

    case Repo.insert(changeset) do
      {:ok, _topic} -> 
        conn
        |> put_flash(:info, "The topic was created")
        |> redirect(to: topic_path(conn, :index))
      {:error, changeset} -> render conn, "new.html", changeset: changeset   
    end
    
  end

end