defmodule HedwigSimpleResponders.SloganTest do
  use Hedwig.RobotCase

  @tag start_robot: true, name: "alfred", responders: [{HedwigSimpleResponders.Slogan, []}]
  test "slogan <brand>", %{adapter: adapter, msg: msg} do
    send adapter, {:message, %{msg | text: "slogan Much Slogans"}}
    assert_receive {:message, %{text: text}}, 5_000
    assert String.contains?(text, "Much Slogans")
  end

  @tag start_robot: true, name: "alfred", responders: [{HedwigSimpleResponders.Slogan, []}]
  test "slogan <stuff>", %{adapter: adapter, msg: msg} do
    send adapter, {:message, %{msg | text: "slogan Slogan's & Stuff"}}
    assert_receive {:message, %{text: text}}, 5_000
    assert String.contains?(text, "Slogan's & Stuff")
  end
end
