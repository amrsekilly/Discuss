defmodule DiscussWeb.CommentsChannel do
  use DiscussWeb, :channel

  def join(name, _, socket) do
    {:ok, %{hey: "there"}, socket}
  end

  def handle_in(name, message, socket) do
    IO.puts "---------------"
    IO.puts name
    IO.puts "---------------"
    IO.inspect message 
    IO.puts "---------------"
    
    {:reply, :ok, socket}
  end
end