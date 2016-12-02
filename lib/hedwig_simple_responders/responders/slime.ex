defmodule HedwigSimpleResponders.Slime do
  @moduledoc """
  You can't do that on chat! Get nostalgic for 80's Nickelodeon
  """
  use Hedwig.Responder

  @usage """
  `i don't know` - You can't do that on chat! Get nostalgic for 80's Nickelodeon
  """

  hear ~r/^(i don['’]?t know)$/i, message do
    slimes = [
      "http://media1.giphy.com/media/ASkzwxye3Tqog/giphy.gif",
      "http://media3.giphy.com/media/cXqN42Xaj3TTW/giphy.gif",
      "http://media.giphy.com/media/JJEeGvzBX0UjS/giphy.gif",
      "http://25.media.tumblr.com/tumblr_lzvxu76oZR1qaphrco1_500.gif",
      "https://cdn2.vox-cdn.com/thumbor/DRuG57jAsWOcZIL5GMQCadrP8mA=/cdn0.vox-cdn.com/uploads/chorus_asset/file/2919370/achildslimed.0.gif",
      "http://stream1.gifsoup.com/view8/4635444/slime-2-o.gif",
      "https://38.media.tumblr.com/tumblr_m80cypMFbZ1qm6uzxo1_250.gif",
      "http://media.giphy.com/media/13oY2AWk5RV5kI/giphy.gif"
      ]
    send message, random(slimes)
  end
end
