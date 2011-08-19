require 'bundler/capistrano'

set :application, "ehinventory"
set :repository,  "git@github.com:lsaffie/ehinventory.git"

set :scm, :git

role :web, "192.75.165.55"                          # Your HTTP server, Apache/etc
role :app, "192.75.165.55"                          # This may be the same as your `Web` server
role :db,  "192.75.165.55", :primary => true # This is where Rails migrations will run

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
