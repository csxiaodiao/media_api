lock "~> 3.11.0"

set :application, "media_api"
set :repo_url, "git@github.com:csxiaodiao/media_api.git"

ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

set :deploy_to, "/app/#{fetch(:application)}_#{fetch(:stage)}"

set :rails_env, 'production'

set :pty, true

set :linked_files, %w{
    config/database.yml
    config/master.key
    .versions.conf
}

set :linked_dirs, %w{
    log 
    tmp/pids 
    tmp/cache 
    tmp/sockets
}

set :keep_releases, 20

set :ssh_options, {forward_agent: true}

set :rvm_ruby_version, "2.5.1@#{fetch(:application)}_#{fetch(:stage)}"

set :tmp_dir, '/tmp'

set :puma_rackup, -> { File.join(current_path, 'config.ru') }
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_bind, "unix://#{shared_path}/tmp/sockets/puma.sock"    #accept array for multi-bind
set :puma_conf, "#{shared_path}/puma.rb"
set :puma_access_log, "#{shared_path}/log/puma_access.log"
set :puma_error_log, "#{shared_path}/log/puma_error.log"
set :puma_role, :app
set :puma_env, "#{fetch(:stage)}"
set :puma_threads, [1, 32]
set :puma_workers, ->{ (fetch(:stage) == 'production') ? 3 : 0 }
set :puma_worker_timeout, nil
set :puma_init_active_record, false
set :puma_preload_app, true

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


