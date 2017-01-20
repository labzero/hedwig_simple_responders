defmodule HedwigSimpleResponders.Slogan do
  @moduledoc """
  `slogan <brand>` - Generate a killer slogan
  """
  use Hedwig.Responder

  @slogan_endpoint "https://4krgs6alv6.execute-api.us-west-2.amazonaws.com/prod/slogan"

  @usage """
  slogan <brand> - Generates a slogan for your awesome brand
  """
  hear ~r/^slogan (?<brand>.*)/i, message do
    brand = message.matches["brand"]
    send message, fetch(URI.encode("#{@slogan_endpoint}?#{URI.encode_query(%{q: brand})}"))
  end

  @doc false
  defp fetch(url) do
    :inets.start()
    :ssl.start()
    case :httpc.request(:get, {String.to_charlist(url),
            [{'User-Agent', 'Hedwig (Elixir/#{System.version})'},
            {'Accept', 'application/json'}]}, [], []) do
      {:ok, {_, _, body}} -> 
        body
        |> to_string
        |> URI.decode
      _ -> 
        "Unable to generate a slogan"
    end
  end

end