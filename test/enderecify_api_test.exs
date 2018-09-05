defmodule EnderecifyApiTest do
  use ExUnit.Case
  doctest EnderecifyApi

  test "greets the world" do
    assert EnderecifyApi.hello() == :world
  end
end
