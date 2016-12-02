defmodule HedwigSimpleResponders.Slogan do
  @moduledoc """
  `slogan <brand>` - Generate a killer slogan
  """
  use Hedwig.Responder

  @usage """
  slogan <brand> - Generates a slogan for your awesome brand
  """
  hear ~r/^slogan (?<brand>.*)/i, message do
    brand = message.matches["brand"]
    send message, fetch("https://slogan-generator.herokuapp.com/api/slogan/#{brand}")
  end

  @doc false
  defp fetch(url) do
    :inets.start()
    :ssl.start()
    case :httpc.request(:get, {String.to_charlist(url),
            [{'User-Agent', 'Hedwig (Elixir/#{System.version})'},
            {'Accept', 'application/json'}]}, [], []) do
      {:ok, {_, _, body}} -> 
        to_string body
      _ -> 
        "Unable to generate a slogan"
    end
  end

end