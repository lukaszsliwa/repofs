lock '3.4.0'

set :application, 'repofs'
set :repo_url, 'lukasz@git.apptamers.com:repofs/app.git'
set :deploy_to, '/var/www/repofs/app'
set :linked_files, %w(config/application.yml config/database.yml config/secrets.yml config/puma.conf db/production.sqlite3)
set :linked_dirs, %w(log tmp/pids tmp/cache tmp/sockets tmp/pids vendor/bundle public/system )

namespace :deploy do
  namespace :puma do
    desc "Reload puma"
    task :reload do
      on roles(:app) do
        pidfile = "#{fetch(:deploy_to)}/shared/tmp/pids/puma.pid"
        execute "kill -s USR2 `cat #{pidfile}` && rm #{pidfile}"
      end
    end

    desc "Start puma"
    task :start do
      on roles(:app) do
        within current_path do
          execute :bundle, "exec puma -C #{current_path}/config/puma.conf -e #{fetch(:rails_env)} -d"
        end
      end
    end

    desc "Stop puma"
    task :stop do
      on roles(:app) do
        pidfile = "#{fetch(:deploy_to)}/shared/tmp/pids/puma.pid"
        execute "kill -s QUIT `cat #{pidfile}` && rm #{pidfile}", raise_on_non_zero_exit: false
      end
    end

    desc "Restart Puma"
    task :restart do
      on roles(:app) do
        invoke 'deploy:puma:stop'
        invoke 'deploy:puma:start'
      end
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'deploy:puma:restart'
    end
  end

  after :publishing, :restart

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, 'tmp:clear'
        end
      end
    end
  end
end

