defmodule Natsun.MixProject do
  use Mix.Project

  def project do
    [
      app: :natsun,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      mod: {Natsun.Application, []},
      extra_applications: [:logger, :telemetry]
    ]
  end

  defp deps do
    [
      {:gnat, "~> 0.6.0"},
      {:poison, "~> 3.1.0"},
      {:telemetry, "~> 0.3.0"},
    ]
  end
end
