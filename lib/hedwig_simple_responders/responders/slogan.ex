defmodule HedwigSimpleResponders.Responders.Slogan do
  @moduledoc """
  Generate a killer slogan
  """
  use Hedwig.Responder

  @usage """
  slogan <brand> - Generates a slogan for your awesome brand
  """
  hear ~r/slogan (?<brand>.*)/i, message do
    brand = message.matches["brand"]
    send message, fetch("https://slogan-generator.herokuapp.com/api/slogan/#{brand}")
  end

  defp fetch(url) do
    :inets.start()
    :ssl.start()
    case :httpc.request(:get, {String.to_charlist(url),
            [{'User-Agent', 'Hedwig (Elixir/#{System.version})'},
            {'Accept', 'application/json'}]}, [], []) do
      {:ok, {_, _, body}} -> 
        body
      _ -> 
        "Unable to generate a slogan"
    end
  end

  def terminate(one, two) do
    IO.inspect one
    IO.inspect two
  end

end