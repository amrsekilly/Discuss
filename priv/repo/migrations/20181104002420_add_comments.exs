defmodule Discuss.Repo.Migrations.AddComments do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :title, :string
      add :user_id, references(:topics)
      add :topic_id, references(:users)

      timestamps()
    end
  end
end
