defmodule HedwigSimpleResponders.Github.ApiClient do

  @doc "return the latest n commits from the specified repo"
  @callback commits(org :: String.t, repo :: String.t, limit :: integer(), access_token :: String.t) :: [any] 

  @doc "shorten the given url"
  @callback shorten_url(url :: String.t) :: String.t
end