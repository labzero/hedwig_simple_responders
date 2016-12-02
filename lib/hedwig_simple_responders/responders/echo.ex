defmodule HedwigSimpleResponders.Echo do
  @moduledoc """
  `echo <text>` - As you would expect, <text> will be echoed back
  """
  use Hedwig.Responder

  @usage """
  echo <text> - As you would expect, <text> will be echoed back
  """
  respond ~r/echo (?<text>.*)$/i, msg do
    reply msg, msg.matches["text"]
  end
end