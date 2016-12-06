use Mix.Config

config :hedwig_simple_responders, :github_api, HedwigSimpleResponders.Github.HttpClient
config :hedwig_simple_responders, :wunderground_api, HedwigSimpleResponders.Wunderground.HttpClient

import_config "#{Mix.env}.exs"

