require "rvm/capistrano" # http://beginrescueend.com/integration/capistrano/
require "bundler/capistrano"

# rvm-capistrano settings
set :rvm_ruby_string, ENV['GEM_HOME'].gsub(/.*\//,"")

namespace :rvm do
  task :create_bundle_wrapper, roles: :app do
    run "rvm wrapper #{rvm_ruby_string} bundle bundle"
  end  
end

after "deploy:create_symlink", "rvm:create_bundle_wrapper"

set :application, "environmentmicrobedb"
set :repository,  "set your repository location here"

set :rvm_ruby_string, '1.9.3-p374'
set :rvm_type, :user

# set :scm, :git # You can set :scm explicitly or Capistrano will make an intelligent guess based on known version control directory names
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "localhost"                          # Your HTTP server, Apache/etc
role :app, "localhost"                          # This may be the same as your `Web` server
role :db,  "localhost", :primary => true 	# This is where Rails migrations will run

# server details
default_run_options[:pty] = true
#ssh_options[:forward_agent] = true
set :deploy_to, "/var/www/rails-apps/"
set :deploy_via, :remote_cache
set :user, "passenger"
set :use_sudo, false

# repo details
set :scm, :git
set :repository,  "https://github.com/erikrikarddaniel/environmentmicrobedb.git"
set :branch, "stable"
set :git_enable_submodules, 1

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start, roles: :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  task :stop, roles: :app do 
  end

  desc "Restart application"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

#THIS links the database file which is stored locally on the application server to the current release.
namespace :db do
  task :db_config, :except => { :no_release => true }, :role => :app do
    run "ln -s ~/webappdbs/environmentmicrobedb/database.yml #{release_path}/config/database.yml"
  end
end

after "deploy:finalize_update", "db:db_config"
#This is neccessary, this will precompile assets. If this is missing we will get strange problems with no errors in the logs.
load 'deploy/assets'
load 'deploy' if respond_to?(:namespace) # cap2 differentiator
