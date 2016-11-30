defmodule HedwigSimpleResponders.Responders.BeerMe do
  @moduledoc """
  Toot Toot!
  """
  use Hedwig.Responder

  @usage """
  beer me - Grab me a beer
  """

  @beers [
    "http://organicxbenefits.com/wp-content/uploads/2011/11/organic-beer-health-benefits.jpg",
    "http://www.beer100.com/images/beermug.jpg",
    "http://blog.collegebars.net/uploads/10-beers-you-must-drink-this-summer/10-beers-you-must-drink-this-summer-sam-adams-summer-ale.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/7/78/GravityTap.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/6/60/Kriek_Beer_1.jpg",
    "https://upload.wikimedia.org/wikipedia/commons/5/52/Paulaner.jpg",
    "http://www.menshealth.com/sites/menshealth.com/files/styles/slideshow-desktop/public/images/slideshow2/beer-intro.jpg",
    "http://media2.s-nbcnews.com/i/MSNBC/Components/Video/__NEW/140908-beer-germany-5a-video.jpg",
    "http://365thingsaustin.com/wp-content/uploads/beer-flight1.jpg",
    ":beer:",
    ":beers:"
  ]

  hear ~r/.*(beer me).*/i, message do
    send message, random(@beers)
  end
end