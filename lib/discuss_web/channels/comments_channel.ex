defmodule DiscussWeb.CommentsChannel do
  use DiscussWeb, :channel
  alias Discuss.Repo
  alias Discuss.Topics.Topic
  alias Discuss.Comments.Comment

  def join("comments:" <> topic_id, _, socket) do
    topic_id = String.to_integer(topic_id)
    topic = Topic 
    |> Repo.get!(topic_id)
    |> Repo.preload(:comments)

    IO.inspect "------------"
    IO.inspect topic
    IO.inspect "------------"

    {:ok, %{}, assign(socket, :topic, topic)}
  end

  def handle_in(name, %{"content" => content}, %{assigns: %{topic: topic}} = socket) do
    changeset = 
      topic
        |> Ecto.build_assoc(:comments)
        |> Comment.changeset(%{content: content})
        |> IO.inspect(label: "hello world")
    
    case Repo.insert(changeset) do
      {:ok, comment} -> 
        {:reply, :ok, socket}
      {:error, _reason} -> 
        {:reply, {:error, %{errors: changeset}}, socket}
    end
  end
end
