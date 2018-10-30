defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller
  alias Discuss.Topics.Topic

  def new(conn, _params) do
    changeset = Topic.changeset(%Topic{}, %{})

    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"topic" => topic}) do
    IO.inspect conn
    IO.inspect topic
  end

end