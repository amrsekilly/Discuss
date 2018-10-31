defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller
  alias Discuss.Topics.Topic
  alias Discuss.Repo

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
    changeset = Repo.get(Topic, id)
    |> Topic.changeset(topic)

    case Repo.update(changeset) do
      {:ok, _topic} ->
        conn
        |> put_flash(:info, "Topic was updated properly!")
        |> redirect(to: topic_path(conn, :index))
      {:error, changeset} -> render conn, "edit.html", changeset: changeset
    end

  end

  def index(conn, _params) do
    topics = Repo.all(Topic)
    render conn, "index.html", topics: topics
  end

  def create(conn, %{"topic" => topic}) do
    changeset = Topic.changeset(%Topic{}, topic)
    case Repo.insert(changeset) do
      {:ok, _topic} -> 
        conn
        |> put_flash(:info, "The topic was created")
        |> redirect(to: topic_path(conn, :index))
      {:error, changeset} -> render conn, "new.html", changeset: changeset   
    end
    
  end

end