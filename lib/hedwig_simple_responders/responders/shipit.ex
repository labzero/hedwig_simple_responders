defmodule HedwigSimpleResponders.ShipIt do
  @moduledoc """
  `ship it` - Display some squirrel motivation
  """
  use Hedwig.Responder

  @usage """
  ship it - Display a motivation squirrel
  """
  hear ~r/ship(ping|z|s|ped)?\s*it/i, message, state do
    try do
      %{opts: %{extra_squirrels: true}} = state
      shipit message
    rescue
      _ in MatchError ->
        Regex.match?(~r/ship\s*it/i, message.text) && shipit(message) || :ok
    end
  end

  @doc false
  @spec shipit(String.t()) :: String.t()
  def shipit(message) do
    squirrels = [
      "http://40.media.tumblr.com/8732a803c04c32dbc04c6cb37add2c44/tumblr_nm3d0o27Rc1urg4cfo1_500.jpg",
      "https://camo.githubusercontent.com/dfd5b1e5bd069d89d70ef0416a9fe41f0c7a57d4/687474703a2f2f692e696d6775722e636f6d2f73374d52672e6a7067",
      "http://www.thetaxidermystore.com/media/catalog/product/cache/1/image/9df78eab33525d08d6e5fb8d27136e95/c/a/canoe-grey-squirrel-taxidermy-mount-_12576-for-sale-_-the-taxidermy-store.jpg",
      "http://worth1000.s3.amazonaws.com/submissions/417000/417372_9ebc_1024x2000.jpg",
      "http://www.guy-sports.com/fun_pictures/squirrel_waterski.jpg",
      "https://s-media-cache-ak0.pinimg.com/originals/31/78/c4/3178c4bf492536b62cf6c47c7b6c1252.jpg",
      "http://images.whatonearthcatalog.com/graphics/products/regular/CM1016.jpg",
      "http://www.catholic.org/files/images/media//1449510356569_700.jpg",
      "https://s-media-cache-ak0.pinimg.com/474x/e2/52/b5/e252b55d1449e244f071ea937a4542c5.jpg",
      "http://mothersofbrothers.com/wp-content/uploads/2013/10/squirrels-mouth-full-with-nuts.jpg",
      "http://www.sugarbushsquirrel.com/image/35263512_scaled_356x480.jpg",
      "http://i.imgur.com/DPVM1.png",
      "http://d2f8dzk2mhcqts.cloudfront.net/0772_PEW_Roundup/09_Squirrel.jpg",
      "http://www.cybersalt.org/images/funnypictures/s/supersquirrel.jpg",
      "http://www.zmescience.com/wp-content/uploads/2010/09/squirrel.jpg",
      "https://dl.dropboxusercontent.com/u/602885/github/sniper-squirrel.jpg",
      "http://1.bp.blogspot.com/_v0neUj-VDa4/TFBEbqFQcII/AAAAAAAAFBU/E8kPNmF1h1E/s640/squirrelbacca-thumb.jpg",
      "https://dl.dropboxusercontent.com/u/602885/github/soldier-squirrel.jpg",
      "https://dl.dropboxusercontent.com/u/602885/github/squirrelmobster.jpeg",
    ]

    send message, random(squirrels)
  end
end
