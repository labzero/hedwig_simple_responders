defmodule HedwigSimpleResponders.JsonApiClientFake do
  @moduledoc """
  A fake API client for use in tests to avoid actual HTTP requests
  """

  @doc """
  Fake responses for PugMe Responder
  """
  def get("http://pugme.herokuapp.com/random") do
    {:ok,
      %{
        "pug" => "http://pugshack.us/cuteness.jpg"
      }
    }
  end

  def get("http://pugme.herokuapp.com/count") do
    {:ok,
      %{
        "pug_count" => 42
      }
    }
  end

  def get("http://pugme.herokuapp.com/bomb?count=3") do
    {:ok,
      %{
        "pugs" => [
          "http://pugshack.us/cuteness1.jpg",
          "http://pugshack.us/cuteness2.jpg",
          "http://pugshack.us/cuteness3.jpg"
        ]
      }
    }
  end

  def get("http://pugme.herokuapp.com/bomb?count=5") do
    {:ok,
      %{
        "pugs" => [
          "http://pugshack.us/cuteness1.jpg",
          "http://pugshack.us/cuteness2.jpg",
          "http://pugshack.us/cuteness3.jpg",
          "http://pugshack.us/cuteness4.jpg",
          "http://pugshack.us/cuteness5.jpg"
        ]
      }
    }
  end

  def get(message) do
    IO.puts "Unrecognized message: #{message}"
  end
end
