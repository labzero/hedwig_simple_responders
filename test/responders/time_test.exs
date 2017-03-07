defmodule HedwigSimpleResponders.TimeTest do
  use Hedwig.RobotCase

  @tag start_robot: true, name: "alfred", responders: [{HedwigSimpleResponders.Time, []}]
  test "alfred time", %{adapter: adapter, msg: msg} do
    send adapter, {:message, %{msg | text: "alfred time"}}
    assert_receive {:message, %{text: text}}
    assert String.contains?(text, "testuser: Local time is now")
    refute_receive {:message, _}
  end

  @tag start_robot: true, name: "alfred", responders: [{HedwigSimpleResponders.Time, []}]
  test "alfred time in Los Angeles", %{adapter: adapter, msg: msg} do
    send adapter, {:message, %{msg | text: "alfred time in Los Angeles"}}
    assert_receive {:message, %{text: text}}
    assert String.contains?(text, "testuser: The time in America/Los_Angeles is")
    refute_receive {:message, _}
  end

  @tag start_robot: true, name: "alfred", responders: [{HedwigSimpleResponders.Time, []}]
  test "alfred time in Los_Angeles", %{adapter: adapter, msg: msg} do
    send adapter, {:message, %{msg | text: "alfred time in Los_Angeles"}}
    assert_receive {:message, %{text: text}}
    assert String.contains?(text, "testuser: The time in America/Los_Angeles is")
    refute_receive {:message, _}
  end

  @tag start_robot: true, name: "alfred", responders: [{HedwigSimpleResponders.Time, []}]
  test "alfred time in Boston", %{adapter: adapter, msg: msg} do
    send adapter, {:message, %{msg | text: "alfred time in Boston"}}
    assert_receive {:message, %{text: text}}
    assert String.contains?(text, "testuser: No timezone matching *Boston*")
    refute_receive {:message, _}
  end

  @tag start_robot: true, name: "alfred", responders: [{HedwigSimpleResponders.Time, []}]
  test "alfred utc", %{adapter: adapter, msg: msg} do
    send adapter, {:message, %{msg | text: "alfred utc"}}
    assert_receive {:message, %{text: text}}
    assert String.contains?(text, "testuser: Coordinated Universal Time is now")
    refute_receive {:message, _}
  end
end
