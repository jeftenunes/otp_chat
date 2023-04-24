defmodule OtpChatTest do
  use ExUnit.Case
  doctest OtpChat

  test "greets the world" do
    assert OtpChat.hello() == :world
  end
end
