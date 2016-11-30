defmodule HedwigSimpleResponders.Flip do
  @moduledoc """
  Flip

  Attempts to flip text in a meaningful way
  """

  use Hedwig.Responder

  @usage """
  flip <text> - Attemps to flip <text> in a meaningful way
  """
  hear ~r/^flip (?<text>.*)/i, message do
    send message, "(╯°□°）╯︵ #{FlipText.flip message.matches["text"]}"
  end
  hear ~r/^unflip (?<text>.*)/i, message do
    send message, "#{FlipText.flip message.matches["text"]} ノ( º _ ºノ)"
  end
end