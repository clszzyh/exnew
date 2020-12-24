defmodule ExnewTest do
  use ExUnit.Case
  doctest Exnew

  test "greets the world" do
    assert Exnew.hello() == :world
  end
end
