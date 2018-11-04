defmodule Discuss.Users.User do
  use Ecto.Schema

  import Ecto.Changeset

  schema "users" do
    field :email, :string
    field :provider, :string
    field :token, :string
    field :username, :string
    field :photo, :string
    has_many :topics, Discuss.Topics.Topic
    has_many :comments, Discuss.Comments.Comment
    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :provider, :token, :username, :photo])
    |> validate_required([:email, :provider, :token])
  end
end
