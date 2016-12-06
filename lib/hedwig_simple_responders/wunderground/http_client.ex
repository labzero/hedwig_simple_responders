defmodule HedwigSimpleResponders.Wunderground.HttpClient do
  @behaviour HedwigSimpleResponders.Wunderground.ApiClient
  
  @url "http://api.wunderground.com/api"
  @token Application.get_env(:hedwig_simple_responders, :wunderground_access_token)

  def get(:weather, location), do: get_data(:forecast, location)
  def get(:forecast = service, location), do: get_data(service, location)
  def get(:radar = service, location), do: get_data(service, location)
  def get(:satellite = service, location), do: get_data(service, location)
  def get(:weathercam, location), do: get_data(:webcams, location)
  def get(:webcams = service, location), do: get_data(service, location)
  def get(service, _), do: {:error, "No such service #{service}"}

  defp get_data(service, location) do
    case HTTPoison.get(url(service, location)) do
      {:ok, %HTTPoison.Response{status_code: status}} when status >= 400 -> 
        {:error, "HTTP status code: #{status}"}
      {:error, %HTTPoison.Error{reason: reason}} -> 
        {:error, reason}  
      {:ok, %HTTPoison.Response{body: json}} ->          
        {:ok, Poison.decode!(json)}          
    end
  end

  defp url(service, location) do
    "#{@url}/#{@token}/#{Atom.to_string(service)}/q/#{URI.encode(location)}.json"
  end

end