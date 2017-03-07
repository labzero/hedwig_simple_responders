defmodule HedwigSimpleResponders.JonyIve do
  @moduledoc """
  A random collection of Jony Ive words mashed together.

  Credit to @bloodyowl for the Jony Ive bullshit generator
  from which some phrases have been included.
  """
  use Hedwig.Responder

  @usage """
  `jony me` - Get some gold from Jony Ive
  `jony define <word>` - Get Jony's perspective on a word
  """
  hear ~r/^jony me$/i, msg do
    send msg, jony_says()
  end

  hear ~r/^aluminium$/i, msg do
    send msg, "https://www.youtube.com/watch?v=GQJ5_-8oEAU"
  end

  hear ~r/^jony define (?<word>[\w]+)$/i, msg do
    send msg, jony_defines(String.capitalize(msg.matches["word"]))
  end

  defp jony_says do
    random(s0) <> random(s1) <> random(s2) <> random(s3)
  end

  defp jony_defines(word) do
      "'#{word}' is a word that's come to mean so much that it's also a word that has come to mean nothing."
  end

  defp glorious_adjectives do
    [
      "simple", "easy", "beautiful", "different", "effortless",
      "remarkable", "timeless", "compelling", "refined",
      "expressive", "clear"
    ]
  end

  defp s0 do
    [
      "Right from the beginning, it appeared to us that designing the new",
      "When we first thought about it, we understood that designing the new"
    ]
  end

  defp s1 do
    [
      " iPhone",
      " iMac",
      " MacBook",
      " Mac Pro",
      " iPod",
      " Apple TV",
      " Watch"
    ]
  end

  defp s2 do
    [
      " wasn't just a matter of beauty",
      " was about creating a whole new experience",
      " had to be about the experience itself",
      " required a whole different approach"
    ]
  end

  defp s3 do
    [
      " which is why this is so " <> random(glorious_adjectives()) <> ". ",
      " and the result is just astonishing. ",
      " and we managed to completely redesign the product. ",
      " and it has become a magical journey."
    ]
  end
end
