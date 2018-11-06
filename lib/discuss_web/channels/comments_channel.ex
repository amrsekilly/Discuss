defmodule DiscussWeb.CommentsChannel do
  use DiscussWeb, :channel
  alias Discuss.Repo
  alias Discuss.Topics.Topic

  def join("comments:" <> topic_id, _, socket) do
    topic_id = String.to_integer(topic_id)
    topic = Repo.get!(Topic, topic_id)
    
    {:ok, %{}, socket}
  end

  def handle_in(name, %{"content" => content}, socket) do
    IO.inspect content
    {:reply, :ok, socket}
  end
end