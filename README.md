# Exnew

[![ci](https://github.com/clszzyh/exnew/workflows/ci/badge.svg)](https://github.com/clszzyh/exnew/actions)
[![Hex.pm](https://img.shields.io/hexpm/v/exnew)](http://hex.pm/packages/exnew)
[![Hex.pm](https://img.shields.io/hexpm/dt/exnew)](http://hex.pm/packages/exnew)
[![Documentation](https://img.shields.io/badge/hexdocs-latest-blue.svg)](https://hexdocs.pm/exnew/readme.html)

<!-- MDOC -->

Elixir struct wrapper.

<!-- MDOC -->
```elixir
iex> {:module, module, _, _} = defmodule Foobar do
...>   use Exnew
...>   defstruct [:c, :d]
...>
...>   @impl true
...>   def handle_new(%{c: 1, d: 2}), do: {:ok, %{c: 2, d: 1}}
...>   def handle_new(%{c: 3, d: 4}), do: {:ok, %{c: 3, d: 4}}
...>   def handle_new(_), do: {:error, :unmatched}
...> end
iex> module.new(%{c: 1, d: 2, e: 3}) |> Map.from_struct()
%{c: 2, d: 1}
iex> module.new([])
** (ArgumentError) [:unmatched] %{}
```
<!-- MDOC -->


## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `exnew` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:exnew, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/exnew](https://hexdocs.pm/exnew).
