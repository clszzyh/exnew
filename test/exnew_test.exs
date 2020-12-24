defmodule ExnewTest do
  use ExUnit.Case
  doctest Exnew

  defmodule Foo do
    use Exnew
    defstruct [:a, :b]
  end

  defmodule Bar do
    use Exnew
    defstruct [:c, :d]

    @impl true
    def handle_new(%{c: 1, d: 2}), do: {:ok, %{c: 2, d: 1}}
    def handle_new(%{c: 3, d: 4}), do: {:ok, %{c: 3, d: 4}}
    def handle_new(_), do: {:error, :unmatched}
  end

  test "default" do
    assert Foo.new(a: 1, b: 2) == %Foo{a: 1, b: 2}
  end

  test "bar" do
    assert Bar.new(c: 1, d: 2) == %Bar{c: 2, d: 1}
    assert Bar.new(c: 3, d: 4, e: 5) == %Bar{c: 3, d: 4}

    assert_raise ArgumentError, "[:unmatched] %{}", fn -> Bar.new([]) end
  end
end
