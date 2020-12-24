defmodule Exnew do
  @external_resource readme = Path.join([__DIR__, "../README.md"])

  @moduledoc readme
             |> File.read!()
             |> String.split("<!-- MDOC -->")
             |> Enum.fetch!(2)

  @type reason :: atom()
  @callback handle_new(map()) :: {:ok, map()} | {:error, reason()}

  defmacro __using__(_) do
    quote do
      @behaviour unquote(__MODULE__)

      @spec new(Enumerable.t()) :: %__MODULE__{}
      def new(%{} = input) do
        case __MODULE__.handle_new(input) do
          {:ok, new_input} -> struct!(__MODULE__, new_input)
          {:error, reason} -> raise(ArgumentError, "[#{inspect(reason)}] #{inspect(input)}")
        end
      end

      def new(enumerable), do: new(Map.new(enumerable))

      @impl unquote(__MODULE__)
      def handle_new(%{} = o), do: {:ok, o}
      defoverridable unquote(__MODULE__)
    end
  end
end
