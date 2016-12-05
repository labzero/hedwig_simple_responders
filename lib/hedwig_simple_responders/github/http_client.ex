defmodule HedwigSimpleResponders.Github.HttpClient do

  @behaviour HedwigSimpleResponders.Github.ApiClient
    
  @url_shortener "https://git.io"
  @access_token Application.get_env(:hedwig_simple_responders, :github_access_token)

  def commits(org, repo, limit, access_token) do
    case HTTPoison.get(commits_url(org, repo, limit), [auth_header(@access_token)]) do
      {:ok, %HTTPoison.Response{status_code: status}} when status >= 400 -> 
        {:error, "HTTP status code: #{status}"}
      {:error, %HTTPoison.Error{reason: reason}} -> 
        {:error, reason}  
      {:ok, %HTTPoison.Response{body: json}} ->          
        {:ok, Poison.decode!(json)}         
    end
  end

  def shorten_url(url) do      
    case HTTPoison.post(@url_shortener, {:form, [{"url", url}]}) do
      {:ok, %HTTPoison.Response{headers: headers}} 
        -> :proplists.get_value("Location", headers)
      _ -> "Invalid Url"
    end  
  end

  defp commits_url(org, repo, limit \\ 5) do
    "https://api.github.com/repos/#{org}/#{repo}/commits?per_page=#{limit}"    
  end

  defp auth_header(token) do
    {"Authorization", "token #{token}"}    
  end  

end