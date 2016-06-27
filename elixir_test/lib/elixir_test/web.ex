defmodule ElixirTest.Web do
  use Plug.Router
  require Logger

  plug Plug.Logger
  plug :match
  plug :dispatch

  def init(options) do
    options
  end

  def start_link do
    {:ok, _} = Plug.Adapters.Cowboy.http ElixirTest.Web, []
  end

  get "/hello" do
    conn
    |> send_resp(200, "Hello, World!")
    |> halt
  end
end
