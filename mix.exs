defmodule RapidNba.MixProject do
  use Mix.Project

  @version "0.1.0"

  def project do
    [
      app: :rapid_nba,
      version: @version,
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs(),
      description: description(),
      package: package(),
      source_url: "https://github.com/col/rapid_nba"
    ]
  end

  def application do
    [
      extra_applications: [:logger],
      env: [api_key: nil]
    ]
  end

  defp deps do
    [
      {:tesla, "~> 1.3.0"},
      {:hackney, "~> 1.16"},
      {:jason, ">= 1.0.0"},
      {:ex_doc, "~> 0.22", only: :dev, runtime: false}
    ]
  end

  defp docs do
    [
      main: "readme",
      extras: ["README.md"],
      source_ref: "v#{@version}"
    ]
  end

  defp description do
    """
    A thin elixir client for API NBA on Rapid API.
    """
  end

  defp package do
    %{
      licenses: ["MIT"],
      maintainers: ["Colin Harris"],
      links: %{"GitHub" => "https://github.com/col/rapid_nba"}
    }
  end
end
