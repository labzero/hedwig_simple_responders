defmodule HedwigSimpleResponders.TroutSlap do
  @moduledoc """
  `slap <target>` | `slap me` - get nostalgic for the good old days using mIRC
  """
  use Hedwig.Responder

  @usage """
  slap - Slaps the target around a bit with a large trout
  """

  hear ~r/^slap me/i, message do
    target = if is_map(message.user) do message.user.name else message.user end
    send message, "slaps #{target} around a bit with a large trout"
  end
  hear ~r/^slaps me/i, _, do: :ok
  hear ~r/^slaps? (?<target>[^<\s]+)/i, message do
    target = message.matches["target"]
    if target == "me" do :ok else send message, "slaps #{target} around a bit with a large trout" end
  end
  # match slack mentions which come over as <@U0DM97L3T>
  hear ~r/^slaps? <@(?<target>[^\s]+)>/i, message do
    # send can reference users, emote/me_message cannot
    send message, "slaps <@#{message.matches["target"]}> around a bit with a large trout"
  end
end
