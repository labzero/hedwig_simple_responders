use Mix.Config
report_path = case System.get_env("CIRCLE_TEST_REPORTS") do
  nil  -> "_build"
  path -> path
end

config :junit_formatter, report_dir: "#{report_path}/test"