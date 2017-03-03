defmodule HedwigSimpleResponders.TroutSlapTest do
  use Hedwig.RobotCase

  @tag start_robot: true, name: "alfred", responders: [{HedwigSimpleResponders.TroutSlap, []}]
  test "slap me", %{adapter: adapter, msg: msg} do
    send adapter, {:message, %{msg | text: "slap me"}}
    assert_receive {:message, %{text: "slaps testuser around a bit with a large trout"}}
    refute_receive {:message, %{text: _}}
  end

  @tag start_robot: true, name: "alfred", responders: [{HedwigSimpleResponders.TroutSlap, []}]
  test "slaps me", %{adapter: adapter, msg: msg} do
    send adapter, {:message, %{msg | text: "slap me"}}
    assert_receive {:message, %{text: "slaps testuser around a bit with a large trout"}}
    refute_receive {:message, %{text: _}}
  end

  @tag start_robot: true, name: "alfred", responders: [{HedwigSimpleResponders.TroutSlap, []}]
  test "slap john", %{adapter: adapter, msg: msg} do
    send adapter, {:message, %{msg | text: "slap john"}}
    assert_receive {:message, %{text: "slaps john around a bit with a large trout"}}
    refute_receive {:message, %{text: _}}
  end

  @tag start_robot: true, name: "alfred", responders: [{HedwigSimpleResponders.TroutSlap, []}]
  test "slaps john", %{adapter: adapter, msg: msg} do
    send adapter, {:message, %{msg | text: "slaps john"}}
    assert_receive {:message, %{text: "slaps john around a bit with a large trout"}}
    refute_receive {:message, %{text: _}}
  end

  @tag start_robot: true, name: "alfred", responders: [{HedwigSimpleResponders.TroutSlap, []}]
  test "slaps <@U39AT1HM1|jsmith>", %{adapter: adapter, msg: msg} do
    send adapter, {:message, %{msg | text: "slaps <@U39AT1HM1|jsmith>"}}
    assert_receive {:message, %{text: "slaps <@U39AT1HM1|jsmith> around a bit with a large trout"}}
    refute_receive {:message, %{text: _}}
  end
end
