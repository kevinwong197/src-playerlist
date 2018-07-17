namespace :server do
  desc 'run development api server'
  task :dev do
    ENV['RACK_ENV'] = 'development'
    sh 'bundle exec rackup'
  end

  desc 'run production server'
  task :serve do
    ENV['RACK_ENV'] = 'production'
    sh 'bundle exec rackup'
  end
end