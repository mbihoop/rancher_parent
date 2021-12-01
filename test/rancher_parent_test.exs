defmodule RancherParentTest do
  use ExUnit.Case
  doctest RancherParent

  test "greets the world" do
    assert RancherParent.hello() == :world
  end
end
