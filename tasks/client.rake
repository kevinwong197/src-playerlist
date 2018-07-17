namespace :client do
  desc 'run frontend development server'
  task :dev do
    sh 'npm run dev'
  end

  desc 'build client'
  task :build do
    sh 'npm run build'
  end
end
