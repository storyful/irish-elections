# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'irish-elections'
set :repo_url, 'git@github.com:storyful/irish-elections.git'

set :user, 'storyful'

set :deploy_via, :remote_cache
set :format, :pretty
set :log_level, :debug
set :keep_releases, 10

set :ssh_options, user: fetch(:user), forward_agent: true

set :use_sudo, false
set :rvm_type, :system

set :linked_files, %w(config/secrets.yml)
set :linked_dirs,  %w(log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system)

# Don't create bin stubs - avoids clashes between Rails 4 and bundler.
set :bundle_binstubs, false

namespace :deploy do
  after :finishing, 'deploy:cleanup'
  after :restart, :clear_cache do
    on roles(:app, :worker), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      within release_path do
        execute :rake, 'cache:clear'
      end
    end
  end
end


