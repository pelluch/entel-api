# config valid only for current version of Capistrano
lock '3.4.0'

set :application, 'entel'
set :repo_url, 'git@github.com:pelluch/entel-api.git'
set :branch, 'master'

set :ssh_options, {
 keys: [ "/home/pablo/.ssh/ubuntu.pem" ],
 forward_agent: true,
 auth_methods: ["publickey"]
}

# Default deploy_to directory is /var/www/my_app
set :deploy_to, '/srv/http/www/echeckit/entel'

# Default value for :scm is :git
set :scm, :git

set :deploy_via, :remote_cache

set :scm_verbose, true

set :use_sudo, false

set :shallow_clone, 1

# Default value for :format is :pretty
set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :info

# Default value for :pty is false
set :pty, false

set :rvm_type, :user

set :bundle_roles, :all                                  # this is default
set :bundle_binstubs, nil     # Rails 4 generates executables
set :bundle_gemfile, -> { release_path.join('Gemfile') } # default: nil
set :bundle_path, -> { shared_path.join('bundle') }      # this is default
set :bundle_without, %w{development test}.join(' ')      # this is default
set :bundle_flags, '--deployment --quiet'                # this is default
set :bundle_env_variables, {}                    # this is default

# Default value for :linked_files is []
set :linked_files, %w{.env}

# Default value for linked_dirs is []
set :linked_dirs, %w{log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
set :keep_releases, 5

# set :rbenv_type, :user
# set :rbenv_ruby, '2.1.2'
# set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} /usr/bin/rbenv exec"
# set :rbenv_map_bins, %w{rake gem bundle ruby rails}
# set :rbenv_roles, :all

set :passenger_restart_with_sudo, true

namespace :deploy do

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

end
