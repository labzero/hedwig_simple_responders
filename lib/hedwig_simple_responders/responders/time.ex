defmodule HedwigSimpleResponders.Time do
  @moduledoc """
  `hedwig time` Current time in server's timezone
  `hedwig time utc` Current UTC time
  `hedwig time in <zone> Current time in specified timezone
  """
  use Hedwig.Responder

  @time_format "{RFC1123}"

  @usage """
  hedwig time - Reply with the local time
  hedwig utc - Reply with Coordinated Universal Time
  hedwig time in <timezone> - Reply with local time in a timezone
  """
  respond ~r/(local )?time$/i, msg do
    now = Timex.format!(Timex.local(), @time_format)
    reply msg, "Local time is now #{now}"
  end

  respond ~r/(time )?utc( time)?$/i, msg do
    now = Timex.format!(Timex.now(), @time_format)
    reply msg, "Coordinated Universal Time is now #{now}"
  end

  respond ~r/time in (?<zone>[\S\/_]+)$/i, msg do
    zone = msg.matches["zone"]
    case Timex.format(Timex.now(zone), @time_format) do
      {:ok, stamp} -> reply msg, "The time in #{zone} is #{stamp}"
      {:error, {:invalid_timezone, _}} -> reply msg, "Invalid timezone: #{zone}"
      _ -> reply msg, "Something else went wrong"
    end
  end
end
