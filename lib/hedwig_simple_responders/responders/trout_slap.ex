defmodule HedwigSimpleResponders.TroutSlap do
  @moduledoc """
  `slap <target>` | `slap me` - get nostalgic for the good old days using mIRC
  """
  use Hedwig.Responder

  @usage """
  slap - Slaps the target around a bit with a large trout
  """

  hear ~r/^slap me/i, message do
    emote(message, "slaps #{message.user.name} around a bit with a large trout")
  end
  hear ~r/^slaps me/i, message, do: :ok
  hear ~r/^slaps?\s*(?<target>\w+).*/i, message do
    emote(message, "slaps #{message.matches["target"]} around a bit with a large trout")
  end
  # match slack mentions which come over as <@U0DM97L3T>
  hear ~r/^slaps?\s*<@(?<target>\w+)>.*/i, message do
    emote(message, "slaps <@#{message.matches["target"]}> around a bit with a large trout")
  end
end
