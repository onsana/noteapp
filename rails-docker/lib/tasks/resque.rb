require 'resque/tasks'
require 'resque_scheduler/tasks'

namespace :resque do
  task :setup do
    require 'resque'
    require 'resque_scheduler'
    require 'resque/scheduler'

    ENV['QUEUE'] = '*'

    Resque.redis = 'localhost:6379' unless Rails.env == 'production'
    Resque.schedule = YAML.load_file(File.join(Rails.root, 'config/resque_scheduler.yml'))
  end
end

Resque.after_fork = Proc.new { ActiveRecord::Base.establish_connection }
