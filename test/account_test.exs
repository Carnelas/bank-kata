defmodule AccountTest do
  use ExUnit.Case
  import Mox
  setup :verify_on_exit!

  test "greets the world" do
    assert Account.hello() == :world
  end
end
