defmodule HedwigResponders do
  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    opts = [strategy: :one_for_one, name: HedwigResponders.Supervisor]
    Supervisor.start_link([], opts)
  end
end
