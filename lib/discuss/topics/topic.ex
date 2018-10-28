defmodule Discuss.Topics.Topic do
  use Ecto.Schema

  import Ecto.Changeset

  schema "topics" do
    field :title, :string
  end
end
