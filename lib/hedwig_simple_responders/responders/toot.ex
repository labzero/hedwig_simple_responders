defmodule HedwigSimpleResponders.Responders.Toot do
  @moduledoc """
  Toot Toot!
  """
  use Hedwig.Responder

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
      "http://i.imgur.com/HxvCgyK.jpg", 
      "http://cdn.meme.am/instances/500x/55272718.jpg"
    ]

    send message, random(toots)
  end
end