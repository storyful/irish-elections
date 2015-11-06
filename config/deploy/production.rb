server 'irish-elections.storyful.com', user: 'storyful', roles: %w(app db web)
set :stage,     :production
set :rails_env, 'production'
set :deploy_to, "/home/#{fetch(:user)}/#{fetch(:application)}"
set :rvm_ruby_version, 'ruby-2.2.3@irish-elections'
