defmodule DiscussWeb.CommentsChannel do
  use DiscussWeb, :channel

  def join(name, _, socket) do
    IO.puts "-----------"
    IO.puts name
    IO.puts "-----------"
    {:ok, %{}, socket}
  end

  def handle_in do
    
  end
end