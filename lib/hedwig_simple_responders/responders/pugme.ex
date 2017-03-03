defmodule HedwigSimpleResponders.PugMe do
  @moduledoc """
  Sometimes we all need a little pug

  `pug me` - Gimme a pug

  `pug bomb` - Drop it like it's hot
  """
  use Hedwig.Responder

  @api_client Application.get_env(:hedwig_simple_responders,
                                  :json_api_client,
                                  HedwigSimpleResponders.JsonApiClient)

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
    with {:ok, json} <- @api_client.get(@url_random_pug),
         {:ok, random_pug} <- Map.fetch(json, "pug") do
      send message, random_pug
    else
      _ -> send message, "Sorry, could not find a random pug"
    end
  end

  hear ~r/how many pugs (are )?there/i, message do
    with {:ok, json} <- @api_client.get(@url_count_pugs),
         {:ok, count} <- Map.fetch(json, "pug_count") do
      send message, "There are #{count} pugs."
    else
      _ -> send message, "Sorry, no pugs could be found and counted!"
    end
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

    with {:ok, json} <- @api_client.get(@url_pug_bomb <> Integer.to_string(limit)),
         {:ok, pugs} <- Map.fetch(json, "pugs") do
      Enum.each pugs, fn pug ->
        send message, pug
      end
    else
      _ -> send message, "Sorry, could not pug bomb!"
    end
  end

  defp defuse_bomb_size(n) when is_number(n), do: n
  defp defuse_bomb_size(n) when is_binary(n), do: String.to_integer(n)
end