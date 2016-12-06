defmodule HedwigSimpleResponders.TestGithubApi do

  @behaviour HedwigSimpleResponders.Github.ApiClient

  def commits(_org, _repo, _limit, _access_token) do
    {:ok, fake_commits}
  end

  def shorten_url(_url) do      
    "http://example.com/short"
  end

  defp fake_commits do
    [
      fake_commit("alice", "abcd", "fixed stuff"),
      fake_commit("bob", "1234", "broke stuff")
    ]     
  end
  
  defp fake_commit(login, sha, message) do
    %{"author" => %{"login" => login}, "sha" => sha, "html_url" => "http://example.com/#{sha}", "commit" => %{"message" => message}}
  end
end