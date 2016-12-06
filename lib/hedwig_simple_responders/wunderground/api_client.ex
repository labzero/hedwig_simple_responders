defmodule HedwigSimpleResponders.Wunderground.ApiClient do

  @type service :: :weather | :forecast | :radar | :satellite | :weathercam | :webcams 
  @callback get(service :: service, location :: String.t) :: map()
 
end