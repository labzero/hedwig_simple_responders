defmodule HedwigResponders.Mixfile do
  use Mix.Project

  def project do
    [app: :hedwig_responders,
     version: "0.1.0",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps()]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [
      applications: [
        :hedwig,
        :logger
      ],
      mod: {HedwigResponders, []}
    ]
  end

  defp deps do
    [
      {:hedwig, "~> 1.0"}
    ]
  end

  defp description do
    """
    A Mopidy responder for Hedwig
    """
  end

  defp package do
    [
      maintainers: ["Tres Trantham"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/trestrantham/hedwig_mopidy"}
    ]
  end
end
