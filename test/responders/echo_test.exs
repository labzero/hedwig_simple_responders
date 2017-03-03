defmodule HedwigSimpleResponders.EchoTest do
  use Hedwig.RobotCase

  @tag start_robot: true, name: "alfred", responders: [{HedwigSimpleResponders.Echo, []}]
  test "echo <text>", %{adapter: adapter, msg: msg} do
    send adapter, {:message, %{msg | text: "alfred echo world domination"}}
    assert_receive {:message, %{text: text}}
    assert text == "testuser: world domination"
    refute_receive {:message, _}
  end
end
