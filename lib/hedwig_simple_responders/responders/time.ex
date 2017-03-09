defmodule HedwigSimpleResponders.Time do
  @moduledoc """
  Show the current server time, or the time in another timezone
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

  respond ~r/((current )?time|what time is it) in (?<zone>[\w\s\/_]+)$/i, msg do
    input_zone = msg.matches["zone"]

    zone = cond do
      Tzdata.canonical_zone?(input_zone) -> input_zone
      matched_zone = matching_zone(input_zone) -> matched_zone
      true -> nil
    end

    case zone do
      nil -> reply msg, "No timezone matching *#{input_zone}*"
      _ -> reply msg, format_time(zone)
    end
  end

  @spec matching_zone(String.t()) :: String.t() | nil
  def matching_zone(text) do
    Enum.find(Tzdata.zone_list,
      fn(timezone) -> zone_contains(timezone, text) end)
  end

  @doc """
  Determines if a given timezone contains some arbitrary text

  ## Parameters
    - timezone: String representing name of timezone
    - text: String containing possible partial match

  ## Examples
      iex> HedwigSimpleResponders.Time.zone_contains("America/Los_Angeles", "Angels")
      true

      iex> HedwigSimpleResponders.Time.zone_contains("America/Mexico_City", "Mexico City")
      true

      iex> HedwigSimpleResponders.Time.zone_contains("Europe/Amsterdam", "Illegal stuff")
      false

      iex> HedwigSimpleResponders.Time.zone_contains("America/Mexico_City", "Mexico_City")
      true
  """
  @spec zone_contains(String.t, String.t) :: boolean
  def zone_contains(timezone, text) do
    subject = case String.contains?(text, " ") do
      false -> String.downcase(timezone)
      true -> String.replace(String.downcase(timezone), "_", " ")
    end

    String.contains?(subject, String.downcase(text))
  end

  @spec format_time(String.t()) :: String.t()
  defp format_time(zone) do
    case Timex.format(Timex.now(zone), @time_format) do
      {:ok, stamp} -> "The time in #{zone} is #{stamp}"
      {:error, {:invalid_timezone, _}} -> "Invalid timezone: #{zone}"
      _ -> "Oops. Something else went wrong"
    end
  end
end
