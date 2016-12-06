defmodule HedwigSimpleResponders.GithubActivity do
  @moduledoc """
  Fetches the last 5 commits for a Github repo

  It requires a github access token, configured like so.
  
  config :hedwig_simple_responders, :github_api_token, "your_access_token"

  """
  use Hedwig.Responder

  @usage """
  github-activity <org>/<repo> - display the last 5 commits for the repo 
  """
  hear ~r/^github-activity (?<org>.*)\/(?<repo>.*)/i, message do
    org = message.matches["org"]
    repo = message.matches["repo"]
    Enum.each(HedwigSimpleResponders.GithubHelper.formatted_commits(org, repo), fn commit -> send message, commit end)    
  end

end

