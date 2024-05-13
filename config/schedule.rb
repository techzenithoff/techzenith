# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
env :PATH, ENV['PATH'] #Add this line

every 24.hours, roles: [:db, :app, :web] do
  rake "logs:clear_logs"#, output: { standard: "#{path}/log/update_football_data_cron.log"}
end

every 2.hours, :roles =>[:db, :app, :web] do
  rake "football:update_football_data"#, output: { standard: "#{path}/log/update_football_data_cron.log"}
  rake "youtube:update_youtube_data"
  rake "pmu:scrape_pmu_results"#, output: { standard: "#{path}/log/scrape_pmu_results.log"}
  rake "pmu:scrape_pmu_programs"#, output: { standard: "#{path}/log/scrape_pmu_programs.log"}
   
end

