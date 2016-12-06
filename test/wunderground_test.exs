defmodule WundergroundTest do
  use ExUnit.Case
  use Hedwig.RobotCase

  @tag start_robot: true, name: "clippy", responders: [{HedwigSimpleResponders.Wunderground, []}]
  test "weather me gets a forecast", %{adapter: adapter, msg: msg} do
    send adapter, {:message, %{msg | text: "weather me Freedonia"}} 
    assert_receive {:message, %{text: text}}, 5000
    assert String.contains?(text, "Freedonia")
    refute String.contains?(text, "went wrong")
    refute String.contains?(text, "more specific")    
  end

  @tag start_robot: true, name: "clippy", responders: [{HedwigSimpleResponders.Wunderground, []}]
  test "radar me gets a radar map image", %{adapter: adapter, msg: msg} do
    send adapter, {:message, %{msg | text: "radar me Freedonia"}} 
    assert_receive {:message, %{text: text}}, 5000
    assert String.contains?(text, "wunderground.com")
    refute String.contains?(text, "went wrong")
    refute String.contains?(text, "more specific")    
  end  

  @tag start_robot: true, name: "clippy", responders: [{HedwigSimpleResponders.Wunderground, []}]
  test "satellite me gets a satellite  image", %{adapter: adapter, msg: msg} do
    send adapter, {:message, %{msg | text: "satellite me Freedonia"}} 
    assert_receive {:message, %{text: text}}, 5000
    assert String.contains?(text, "wunderground.com")
    refute String.contains?(text, "went wrong")
    refute String.contains?(text, "more specific")    
  end    

  @tag start_robot: true, name: "clippy", responders: [{HedwigSimpleResponders.Wunderground, []}]
  test "weathercam me gets a weathercam image and info", %{adapter: adapter, msg: msg} do
    send adapter, {:message, %{msg | text: "satellite me Freedonia"}} 
    assert_receive {:message, %{text: text}}, 5000
    assert String.contains?(text, "in")
    assert String.contains?(text, "wunderground.com")    
    refute String.contains?(text, "went wrong")
    refute String.contains?(text, "more specific")    
  end    

end