defmodule HedwigSimpleResponders.Wunderground do
  @moduledoc """
  Get weather information for any location

  This requires a API access token from api.wunderground.com
  You'll need to set it in your bots config:

  config :hedwig_simple_responders, :wunderground_access_token, <YOUR_TOKEN_HERE>
  """
  use Hedwig.Responder
  alias HedwigSimpleResponders.Wunderground.WundergroundHelper

  @usage """
   <botname> weather me <location> - short-term forecast
   <botname> radar me <location> - recent radar image
   <botname> satellite me <location> - get a recent satellite image
   <botname> weathercam me <location> - get a weather webcam image near location 
  """

  hear ~r/weather (me|at|for|in)? (?<location>.*)$/i, message do
    msg = 
      message
      |> location 
      |> WundergroundHelper.weather
    send message, msg
  end

  hear ~r/radar (me|at|for|in)? (?<location>.*)$/i, message do
    msg = 
      message
      |> location
      |> WundergroundHelper.radar    
    send message, msg
  end

  hear ~r/satellite (me|at|for|in)? (?<location>.*)$/i, message do
    msg = 
      message
      |> location 
      |> WundergroundHelper.satellite
    send message, msg
  end

  hear ~r/weathercam (me|at|for|in)? (?<location>.*)$/i, message do
    msg = 
      message
      |> location 
      |> WundergroundHelper.weathercam
    send message, msg    
  end    

  defp location(message) do
    message.matches["location"]
  end

end

