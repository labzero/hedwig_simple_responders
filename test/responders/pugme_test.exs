defmodule HedwigSimpleResponders.PugMeTest do
  use Hedwig.RobotCase

  @tag start_robot: true, name: "alfred", responders: [{HedwigSimpleResponders.PugMe, []}]
  test "pug me", %{adapter: adapter, msg: msg} do
    send adapter, {:message, %{msg | text: "pug me"}}
    assert_receive {:message, %{text: text}}
    assert String.contains?(text, "cuteness.jpg")
    refute_receive {:message, %{text: _}}
  end

  @tag start_robot: true, name: "alfred", responders: [{HedwigSimpleResponders.PugMe, []}]
  test "pug bomb", %{adapter: adapter, msg: msg} do
    send adapter, {:message, %{msg | text: "pug bomb"}}
    assert_receive {:message, %{text: "http://pugshack.us/cuteness1.jpg"}}
    assert_receive {:message, %{text: "http://pugshack.us/cuteness2.jpg"}}
    assert_receive {:message, %{text: "http://pugshack.us/cuteness3.jpg"}}
    assert_receive {:message, %{text: "http://pugshack.us/cuteness4.jpg"}}
    assert_receive {:message, %{text: "http://pugshack.us/cuteness5.jpg"}}
    refute_receive {:message, %{text: _}}
  end

  @tag start_robot: true, name: "alfred", responders: [{HedwigSimpleResponders.PugMe, []}]
  test "pug bomb <limit>", %{adapter: adapter, msg: msg} do
    send adapter, {:message, %{msg | text: "pug bomb 3"}}
    assert_receive {:message, %{text: "http://pugshack.us/cuteness1.jpg"}}
    assert_receive {:message, %{text: "http://pugshack.us/cuteness2.jpg"}}
    assert_receive {:message, %{text: "http://pugshack.us/cuteness3.jpg"}}
    refute_receive {:message, %{text: _}}
  end

  @tag start_robot: true, name: "alfred", responders: [{HedwigSimpleResponders.PugMe, []}]
  test "how many pugs are there?", %{adapter: adapter, msg: msg} do
    send adapter, {:message, %{msg | text: "how many pugs are there?"}}
    assert_receive {:message, %{text: "There are 42 pugs."}}
    refute_receive {:message, %{text: _}}
  end
end
