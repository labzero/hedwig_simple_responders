defmodule HedwigSimpleResponders.Responders.Echo do
  @moduledoc """
  Simple Hedwig Responder that will echo back to you
  """
  use Hedwig.Responder

  @usage """
  echo <text> - As you would expect, <text> will be echoed back
  """
  respond ~r/echo (?<text>.*)$/i, msg do
    reply msg, msg.matches["text"]
  end
end