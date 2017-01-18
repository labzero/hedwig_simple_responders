defmodule HedwigSimpleResponders.Manatee do
  @moduledoc """
    Calming manatee uses advanced computer technology to automatically detect sad or stressed employees and tries to make them feel better
  """

  use Hedwig.Responder

  @usage """
  Calming manatee uses advanced computer technology to automatically detect sad or stressed employees and tries to make them feel better
  """
  hear ~r/calm down|calm it down|stay calm|manatee/i, msg do
    send msg, random_manatee()
  end

  @doc false
  def random_manatee do
    manatee = :rand.uniform(34)
    "http://calmingmanatee.com/img/manatee#{manatee}.jpg"
  end
end