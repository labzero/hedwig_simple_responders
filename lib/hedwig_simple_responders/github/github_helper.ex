defmodule HedwigSimpleResponders.GithubHelper do

  @github_api Application.get_env(:hedwig_simple_responders, :github_api)
  
  def formatted_commits(org, repo, limit \\ 5) do
    case commits(org, repo, limit) do
      {:ok, commits} ->         
        Enum.map(commits, &format_commit/1)
      {:error, reason} -> 
        ["Error: #{reason}"]
    end      
  end

  defp commits(org, repo, limit \\ 5) do
    @github_api.commits(org, repo, limit, @access_token)
  end

  defp format_commit(%{"author" => %{"login" => login}, "sha" => sha, "html_url" => url, "commit" => %{"message" => message}}) do
    "Author: *#{login}*\n_#{message}_\n#{short_url(url)} "    
  end

  defp format_commit(_) do
    "could not format commit"
  end

  defp short_url(url) do
    @github_api.shorten_url(url)
  end

end