defmodule SecretsManagerProvider.MixProject do
  use Mix.Project

  @version "0.3.0"
  @url "https://github.com/christopherlai/secrets_manager_provider"
  @name "SecretsManagerProvider"

  def project do
    [
      app: :secrets_manager_provider,
      version: @version,
      elixir: "~> 1.9",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      docs: docs(),
      homepage: @url,
      name: @name,
      package: package(),
      source: @url
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
      {:configparser_ex, "~> 4.0", override: true, only: [:dev, :test]},
      {:credo, "~> 1.1", only: [:dev, :test], runtime: false},
      {:ex_aws, "~> 2.0"},
      {:ex_aws_ssm, "~> 2.0"},
      {:ex_doc, "~> 0.20.2", only: :dev, runtime: false},
      {:hackney, "~> 1.15"},
      {:jason, "~> 1.1", optional: true},
      {:mox, "~> 0.5.1", only: [:test]},
      {:toml, "~> 0.5.2", optional: true}
    ]
  end

  defp docs do
    [
      main: @name,
      source_ref: "v#{@version}",
      source_url: @url,
      extras: ["README.md"]
    ]
  end

  defp package do
    [
      description: "AWS Secrets Manager ConfigProvider",
      files: ["lib", "config", "mix.exs", "README*"],
      maintainers: ["Christopher Lai"],
      licenses: ["MIT"],
      links: %{github: @url}
    ]
  end
end
