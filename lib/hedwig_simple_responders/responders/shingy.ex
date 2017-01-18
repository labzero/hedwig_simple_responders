defmodule HedwigSimpleResponders.Shingy do
  @moduledoc """
  Mention the digital prophet for a chance to peer into the future of digital.
  """
  use Hedwig.Responder

  @usage """
  shingy - Receive a nugget of inspiration for AOL's very own Digital Prophet
  """

  @wisdom [
    "Lots of audio. Love, love, love. We love sound. I think sound in the future is very, very important",
    "When we're having intimate conversations and we're stuck on our screens, dude, it's a whole other scene, man and it's pizzing.",
    "Attention is the new currency...mindshare equals marketshare, and that's where consumers are going to pass your brand on.",
    "I'm an artist... For your digital palettes I want you to think about three colours: Technology, content, distribution.",
    "For your digital palettes I want you to think about three colours: Technology, content, distribution.",
    "Remix Culture. Participate authentically. Fail Forward Foundation.",
    "Remix Culture.",
    "Fail Forward Foundation.",
    "I'm more of a caffeine-free, gluten-free, raw-food sort of guy, but I am able to find something to like in every brand once I hear their story.",
    "Dude, it's a whole other scene, man and it's pizzing.",
    "Embrace always logged in.",
    "Imagine pictures that exlode",
    "Digital, yeah?",
    "Digital",
    "Is always on always good? 'Always on' is important versus 'always relevant' is more important.",
    "Storytelling is about what we are empowered to do. Be provoked. Be provoking.",
    "Remix yur budgets and embrace the fact that your brands are being utilised.",
    "We're freaky for video, man.",
    "6 - ?",
    "I think there's a time and place for things to change, man, and we're in a place where people can look weird and they can have weird titles",
    "Clearly I don't look like a prophet, my man.",
    "I fly all around the world and go to conferences.",
    "\"Wanted to show you a little brain fart I had on the plane,\" he said. It was a cartoon he had drawn of a bear wearing zebra-print pants and a shirt covered in ones and zeros.",
    "Everyone is talking about SoLoMo—social, local, mobile—but they should be talking about HoMo: home/mobile, cell phones used on the couch.",
    "https://soundcloud.com/shingy/little-darling",
    "DIGITAL",
    "Digital, shhhh!",
    "Right. Here we are, yes? All of us together in the here, in the now, yeah?",
    "It's all about digital, yeah?",
    "The web allows us to be everywhere with our eyes, right?",
    "Hey, rocket. Once the future, now the past.",
    "Noise. Communication, yeah? Through sound waves, right? Wave bye-bye. gone. digital. right.",
    "Nature. right? Renewal. Recycle. It's a lifecycle, man. It's digital, right?",
    "Time. Melting. Tempus Fugit in-flight, gone forever, shoot it down, we missed it. digital.",
    "Micro is macro. Small is big. Up is down. I'm a clown. Digital.",
    "Digital."
  ]

  hear ~r/(shingy|shangy)/i, message do
    send message, random(@wisdom)
  end
  hear ~r/^digital$/i, message do
    send message, random(@wisdom)
  end
end