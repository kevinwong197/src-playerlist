namespace :docker do
  desc 'build docker image'
  task :build do
    sh 'docker build -t src-playerlist .'
  end

  desc 'remove docker image'
  task :remove do
    sh 'docker rmi src-playerlist'
  end

  desc 'run docker image'
  task :run do
    sh 'docker run --rm --env-file ./.env -p 3000:3000 -i -t src-playerlist'
  end
end
