defmodule HedwigSimpleResponders.RawApiClient do
  @moduledoc """
  A general-purpose client for making HTTP requests
  """

  @doc false
  def get(url) do
    :inets.start()
    :ssl.start()
    case :httpc.request(:get, {String.to_charlist(url),
            [{'User-Agent', 'Hedwig (Elixir/#{System.version})'},
            {'Accept', 'application/json'}]}, [], []) do
      {:ok, {_, _, body}} -> 
        to_string body
      _ -> 
        "Unable to get response body"
    end
  end
end