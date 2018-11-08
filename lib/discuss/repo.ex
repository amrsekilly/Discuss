defmodule Discuss.Repo do
  use Ecto.Repo, otp_app: :discuss

  @doc """
  Dynamically loads the repository url from the
  DATABASE_URL environment variable.
  """
  def init(_, opts) do
    {:ok, Keyword.put(opts, :url, System.get_env("DATABASE_URL"))}
  end
end

adapter: Ecto.Adapters.Postgres,
username: "postgres",
password: "postgres",
database: "my_app_dev",
pool_size: 10
end