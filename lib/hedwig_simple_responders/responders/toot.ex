defmodule HedwigSimpleResponders.Toot do
  @moduledoc """
  `toot` - show some enthusiasm
  """
  use Hedwig.Responder

  @bot_name "Toot-Toot"
  @bot_emoji ":ship:"

  @usage """
  toot - shows some enthusiasm
  """
  hear ~r/^(toot|oops)$/i, message do
    toots = [
      "http://i.imgur.com/QXCfHbg.jpg",
      "http://i.imgur.com/wFXLWhB.jpg", 
      "http://i.imgur.com/lMUJl7H.jpg", 
      "http://i.imgur.com/dAGscRH.jpg",
      "http://i.imgur.com/A0ar3cc.jpg",
      "http://i.imgur.com/WbHVjlN.jpg",
      "http://i.imgur.com/sAiB5Vc.jpg",
      "http://i.imgur.com/MFBtdDC.jpg",
      "http://i.imgur.com/HxvCgyK.jpg"
    ]

    send message, random(toots)
  end
end