defmodule HedwigSimpleResponders.PugMe do
  @moduledoc """
  Sometimes we all need a little pug

  `pug me` - Gimme a pug

  `pug bomb` - Drop it like it's hot
  """
  use Hedwig.Responder

  @bot_name "PugMe"
  @bot_emoji ":dog:"

  @url_random_pug "http://pugme.herokuapp.com/random"
  @url_count_pugs "http://pugme.herokuapp.com/count"
  @url_pug_bomb "http://pugme.herokuapp.com/bomb?count="

  @default_pug_bomb_size 5
  @insane_pug_bomb_size 20

  @usage """
  pug me - Gimme a pug
  pug bomb - Drop it like it's hot
  """
  hear ~r/^pug me/i, message do
    fetch(@url_random_pug)
    |> Poison.Parser.parse!
    |> Map.fetch!("pug")
    |> pug(message)
  end

  hear ~r/how many pugs (are )?there/i, message do
    fetch(@url_count_pugs)
    |> Poison.Parser.parse!
    |> Map.fetch!("pug_count")
    |> pug(message)
  end

  hear ~r/^pug bomb\s?(\d+)?/i, message do
    wanted_limit = message.matches
    |> Map.get(1, @default_pug_bomb_size)
    |> defuse_bomb_size

    limit = cond do
      wanted_limit > @insane_pug_bomb_size -> @insane_pug_bomb_size
      wanted_limit == 0 -> @default_pug_bomb_size
      true -> wanted_limit
    end

    @url_pug_bomb <> Integer.to_string(limit)
    |> fetch
    |> Poison.Parser.parse!
    |> Map.fetch!("pugs")
    |> pug(message)
  end

  defp defuse_bomb_size(n) when is_number(n), do: n
  defp defuse_bomb_size(n) when is_binary(n), do: String.to_integer(n)

  defp pug(pug, message) when is_bitstring(pug) do
    send message, pug
  end

  defp pug(count, message) when is_integer(count) do
    send message, "There are #{count} pugs."
  end

  defp pug(pugs, message) when is_list(pugs) do
    Enum.each pugs, fn pug ->
      send message, pug
    end
  end

  # @todo: call our helpa!
  defp fetch(url) do
    :inets.start()
    :ssl.start()
    case :httpc.request(:get, {String.to_charlist(url),
            [{'User-Agent', 'Hedwig (Elixir/#{System.version})'},
            {'Accept', 'application/json'}]}, [], []) do
      {:ok, {_, _, body}} -> 
        to_string body
      _ -> 
        "Unable to get response body"
    end
  end
end