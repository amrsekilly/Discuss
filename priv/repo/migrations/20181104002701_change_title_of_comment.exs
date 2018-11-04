defmodule Discuss.Repo.Migrations.ChangeTitleOfComment do
  use Ecto.Migration

  def change do
    rename table(:comments), :title, to: :content
  end
end
