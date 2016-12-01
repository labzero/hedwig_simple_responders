defmodule HedwigSimpleResponders.TroutSlap do
  @moduledoc """
  Something fishy is going on
  """
  use Hedwig.Responder

  @usage """
  slap - Slaps the target around a bit with a large trout
  """

  hear ~r/slap me/i, message do
    emote(%{message | private: %{ responded: true }}, "slaps #{message.user} around a bit with a large trout")
  end

  hear ~r/slaps?\s*(.+)/i, message do
    target = Map.get(message.matches, 1)
    case target do
      "me" -> :ok
      _ -> emote(message, "slaps #{target} around a bit with a large trout")
    end
  end
end
