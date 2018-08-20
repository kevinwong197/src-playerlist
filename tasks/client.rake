namespace :client do
  desc 'run frontend development server'
  task :dev do
    Dir.chdir 'frontend' do
      sh 'npm run dev'
    end
  end

  desc 'build client'
  task :build do
    Dir.chdir 'frontend' do
      sh 'npm run build'
    end
  end
end
