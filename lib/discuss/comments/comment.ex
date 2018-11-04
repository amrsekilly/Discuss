defmodule Discuss.Comments.Comment do
  use Ecto.Schema

  import Ecto.Changeset

  schema "comments" do
    field :content, :string
    belongs_to :topic, Discuss.Topics.Topic
    belongs_to :user, Discuss.Users.User
    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:content, :user_id, :topic_id])
    |> validate_required([:content, :user_id, :topic_id])
  end
end
