defmodule HedwigSimpleResponders.Mixfile do
  use Mix.Project

  def project do
    [app: :hedwig_simple_responders,
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
      mod: {HedwigSimpleResponders, []}
    ]
  end

  defp deps do
    [
      {:hedwig, "~> 1.0"}
    ]
  end

  defp description do
    """
    A collection of simple responders for Hedwig
    """
  end

  defp package do
    [
      maintainers: ["Brien Wankel", "Rob Adams"],
      licenses: ["MIT"],
      links: %{"GitHub" => "https://github.com/labzero/hedwig_simple_responders"}
    ]
  end
end
