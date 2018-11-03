defmodule Discuss.Repo.Migrations.AddUsers do
  use Ecto.Migration

  def change do
    alter table("users") do
      add :photo, :string      
    end 
  end
end
