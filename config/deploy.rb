require 'bundler/capistrano'

# set :gateway, 'jmaya@www.lasamaria.com'

set :default_environment, {'PATH' => "$HOME/.rbenv/shims:$HOME/.rbenv/bin:/usr/local/bin:$PATH" }
set :bundle_flags, "--deployment --quiet --binstubs --shebang ruby"

set :application, "ell"
# set :repository,  "."
set :repository, "https://github.com/jmaya/ell_services_log.git"

set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`
#

set :normalize_asset_timestamps, false


set :user, "deployer"
set :use_sudo, false
default_run_options[:pty] = true
set :ssh_options, { :forward_agent => true }

# set :deploy_via, :copy
# set :copy_exclude, ".git/*"


role :web, "198.211.98.24"
role :app, "198.211.98.24"
role :db,  "198.211.98.24", :primary => true # This is where Rails migrations will run

# if you're still using the script/reaper helper you will need
# these http://github.com/rails/irs_process_scripts

# If you are using Passenger mod_rails uncomment this:
namespace :deploy do
  task :start do 
    sudo "/etc/init.d/unicorn_#{application} start"
    end
  task :stop do
    sudo "/etc/init.d/unicorn_#{application} stop"
  end
  task :restart, :roles => :app, :except => { :no_release => true } do
    sudo "/etc/init.d/unicorn_#{application} restart"
  end
end

namespace :custom do
  task :symlink_unicorn_init do
     # sudo "ln -nfs #{release_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
  end

  task :symlink_db do
     run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end

   task :pipeline_precompile do
    run "cd #{release_path}; RAILS_ENV=production rake assets:precompile"
    deploy::stop
    deploy::start
  end
end

namespace :deploy do
  namespace :assets do
    task :precompile, :roles => :web, :except => { :no_release => true } do
      from = source.next_revision(current_revision)
      if capture("cd #{latest_release} && #{source.local.log(from)} vendor/assets/ app/assets/ | wc -l").to_i > 0
        run %Q{cd #{latest_release} && #{rake} RAILS_ENV=#{rails_env} #{asset_env} assets:precompile}
      else
        logger.info "Skipping asset pre-compilation because there were no asset changes"
      end
    end
  end
end

after "deploy:update_code", "custom:symlink_db"
# after "deploy:symlink", "custom:symlink_unicorn_init"
# after "deploy:symlink", "custom:symlink_items"
# after "deploy:create_symlink", "custom:pipeline_precompile"
