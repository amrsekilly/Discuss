defmodule DiscussWeb.TopicController do
  use DiscussWeb, :controller
  alias Discuss.Topics.Topic

  def new(conn, params) do
    changeset = Topic.changeset(%Topic{}, %{title: "Testing with a topic"})
  end
end