defmodule Exnew do
  @external_resource readme = Path.join([__DIR__, "../README.md"])

  @moduledoc readme
             |> File.read!()
             |> String.split("<!-- MDOC -->")
             |> Enum.fetch!(2)

  # @callback handle_new()

  defmacro __using__(_) do
  end
end
