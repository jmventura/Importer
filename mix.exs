defmodule Importer.MixProject do
  use Mix.Project

  def project do
    [
      app: :Importer,
      version: "0.1.0",
      elixir: "~> 1.11",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:poison, "~> 3.1"},
      {:flow, "~> 1.0"},
      {:benchee, "~> 1.0", only: :dev},
      {:erlsom, "~>1.4"}
    ]
  end
end
