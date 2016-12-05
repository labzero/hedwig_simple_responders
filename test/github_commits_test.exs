defmodule GithubCommitsTest do
  use ExUnit.Case
  use Hedwig.RobotCase

  @tag start_robot: true, name: "clippy", responders: [{HedwigSimpleResponders.GithubActivity, []}]
  test "github-activity displays commits", %{adapter: adapter, msg: msg} do
    send adapter, {:message, %{msg | text: "github-activity labzero/lunch"}}
    Enum.each(0..1, fn _ -> 
      assert_receive {:message, %{text: text}}, 5000
      assert String.contains?(text, "Author:")
      end)
  end
end