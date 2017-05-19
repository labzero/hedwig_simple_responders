defmodule HedwigSimpleResponders.Slogan do
  @moduledoc """
  `slogan <brand>` - Generate a killer slogan
  """
  use Hedwig.Responder

  @slogan_endpoint "https://4krgs6alv6.execute-api.us-west-2.amazonaws.com/prod/slogan"
  @api_client Application.get_env(:hedwig_simple_responders,
                                  :raw_api_client,
                                  HedwigSimpleResponders.RawApiClient)

  @usage """
  slogan <brand> - Generates a slogan for your awesome brand
  """
  hear ~r/^slogan (?<brand>.*)/i, message do
    brand = message.matches["brand"]
    send message, make_slogan(brand)
  end

  @doc false
  defp make_slogan(brand) do
    @slogan_endpoint <> "?" <> URI.encode_query(%{q: brand})
    |> @api_client.get
  end
end
