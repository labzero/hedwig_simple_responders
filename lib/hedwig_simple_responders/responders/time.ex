defmodule HedwigSimpleResponders.Time do
  @moduledoc """
  `<your_bot_name> time` Ask your Hedwig.Robot for the current server time
  """
  use Hedwig.Responder

  @bot_name "Clock"
  @bot_emoji ":alarm_clock:"

  @usage """
  time - Reply with current time
  """
  respond ~r/time/i, msg do
    send msg, "Server time is: #{DateTime.utc_now |> to_string}"
  end
end