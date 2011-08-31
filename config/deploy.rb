require 'bundler/capistrano'

## This get cap to see my bundled gems
$:.unshift(File.expand_path('./lib', ENV['rvm_path'])) # Add RVM's lib directory to the load path.
require "rvm/capistrano"                  # Load RVM's capistrano plugin.
set :rvm_ruby_string, '1.9.2'        # Or whatever env you want it to run in.
################

set :application, "ehinventory"
set :repository,  "git@github.com:lsaffie/ehinventory.git"

set :scm, :git

role :web, "itrac.ehealthinnovation.org"                          # Your HTTP server, Apache/etc
role :app, "itrac.ehealthinnovation.org"                          # This may be the same as your `Web` server
role :db,  "itrac.ehealthinnovation.org", :primary => true # This is where Rails migrations will run

set :user, "deploy"
set :use_sudo, false
set :deploy_to, "/home/#{user}/#{application}"
set :deploy_via, :remote_cache
ssh_options[:forward_agent] = true
default_run_options[:pty] = true

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
# namespace :deploy do
#   task :start do ; end
#   task :stop do ; end
#   task :restart, :roles => :app, :except => { :no_release => true } do
#     run "#{try_sudo} touch #{File.join(current_path,'tmp','restart.txt')}"
#   end
# end
namespace :deploy do
  desc "Symlinks the database.yml"
  task :symlink_db, :roles => :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"                                      
  end
end

after 'deploy:symlink', 'deploy:symlink_db'
