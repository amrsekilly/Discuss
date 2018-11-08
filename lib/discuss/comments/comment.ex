defmodule Discuss.Comments.Comment do
  use Ecto.Schema

  import Ecto.Changeset

  @derive {Poison.Encoder, only: [:content, :user]}

  schema "comments" do
    field :content, :string
    belongs_to :topic, Discuss.Topics.Topic
    belongs_to :user, Discuss.Users.User
    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:content])
    |> validate_required([:content])
  end
end
