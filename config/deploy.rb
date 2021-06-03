# config valid for current version and patch releases of Capistrano
lock "~> 3.16.0"

set :application, "Sipepa"
set :repo_url, "git@github.com:nicolaslarrea/sipepa.git"

set :branch, ENV['DEPLOY_BRANCH'] || :main

# rbenv.
set :rbenv_type, :user
set :rbenv_ruby, File.read('.ruby-version').strip

# rails.
# Seleccionar la llave de las credenciales según el entorno.
set :key_path, "config/credentials/#{fetch(:stage)}.key"

append :linked_dirs,
  'log',
  'tmp/pids',
  'tmp/cache',
  'tmp/sockets',
  'storage',
  'public/packs'

append :linked_files,
  fetch(:key_path)

# Puma.
set :puma_preload_app, true
set :puma_init_active_record, true
set :systemd_service_name, 'rananube.service'

# Tareas extras.
after 'deploy:updated', 'webpacker:precompile'
after 'deploy', 'deploy:restart'
