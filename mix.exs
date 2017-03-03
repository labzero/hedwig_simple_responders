defmodule HedwigSimpleResponders.Mixfile do
  use Mix.Project

  def project do
    [app: :hedwig_simple_responders,
     version: "0.1.2",
     elixir: "~> 1.3",
     elixirc_paths: elixirc_paths(Mix.env),
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     description: description(),
     package: package(),
     deps: deps()
    ]
  end

  def application do
    [
      applications: [
        :hedwig,
        :logger,
        :flip_text,
        :httpoison
      ],
      mod: {HedwigSimpleResponders, []}
    ]
  end

  defp deps do
    [
      {:hedwig, "~> 1.0"},
      {:flip_text, "~> 0.1"},
      {:poison, "~> 3.0"},
      {:httpoison, "~> 0.10.0"},
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:junit_formatter, "~> 1.2", only: :test},
      {:credo, "~> 0.5", only: [:dev, :test]}
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

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(:dev), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]
end
