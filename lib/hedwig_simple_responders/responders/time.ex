defmodule HedwigSimpleResponders.Time do
  @moduledoc """
  `<your_bot_name> time` Ask your Hedwig.Robot for the current server time
  """
  use Hedwig.Responder

  @usage """
  time - Reply with current time
  """
  respond ~r/time/i, msg do
    send msg, "The time now is: #{Timex.format!(Timex.now("America/Los_Angeles"),"{RFC1123}")}"
  end

  def bot_identity(_, _) do
    %{name: "Clock", emoji: clock_emoji(Timex.now("America/Los_Angeles")), thumbnail: nil}
  end

  def add_an_hour(12), do: 1
  def add_an_hour(hour), do: hour + 1

  def clock_emoji(now) do
    hour = if now.hour > 12 do now.hour - 12 else now.hour end
    
    time_str = cond do
      now.minute > 45 -> Integer.to_string(add_an_hour(hour)) <> ""
      now.minute >= 20 -> Integer.to_string(hour) <> "30"
      true -> Integer.to_string(hour)
    end
    ":clock#{time_str}:"
  end
end