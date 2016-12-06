defmodule HedwigSimpleResponders.Wunderground.WundergroundFormatter do

  @use_metric Application.get_env(:hedwig_simple_responders, :wunderground_use_metric) || false

  def format(%{"results" => results}) when length(results) > 1 do
    "Multiple results for this location. Be more specific"  
  end

  def format(%{"forecast" => %{"txt_forecast" => %{"forecastday" => [%{"title" => title, "fcttext" => imperial, "fcttext_metric" => metric}|_]}}}, location) do
    text = if @use_metric do
      metric
    else
      imperial
    end
    "#{title} in #{location}: #{text}"    
  end

  def format(%{"radar" => %{"image_url" => url}}, _location) do
    "#{url}.png"
  end   

  def format(%{"satellite" => %{"image_url" => url}}, _location) do
    "#{url}.png"    
  end     

  def format(%{"webcams" => webcams}, _location) do
    case webcams do
      [] -> ["no webcams near location"]
      cams -> 
        %{"handle" => handle, "city" => city, "state" => state, "CURRENTIMAGEURL" => url} = Enum.random(cams)        
        "#{handle} in #{city}, #{state} \n#{url}#.png"
    end
  end

  def format(_, _) do
    "You probably need to provide a more specific location"
  end  
end