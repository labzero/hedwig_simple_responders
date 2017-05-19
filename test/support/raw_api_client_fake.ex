defmodule HedwigSimpleResponders.RawApiClientFake do
  @moduledoc """
  A fake API client for use in tests to avoid actual HTTP requests
  """

  @doc """
  Simulates the raw response from a GET request.
  """
  def get("https://4krgs6alv6.execute-api.us-west-2.amazonaws.com/prod/slogan?q=Much+Slogans") do
    "Much Slogans, get up and go."
  end

  def get("https://4krgs6alv6.execute-api.us-west-2.amazonaws.com/prod/slogan?q=Slogan%27s+%26+Stuff") do
    "Slogan's & Stuff, get up and go."
  end

  def get(message) do
    IO.puts "Unrecognized message: #{message}"
    "Unrecognized message: #{message}"
  end
end
