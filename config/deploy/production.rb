# Deploy en entorno de producción.
set :deploy_user, ENV['SIPEPA_DEPLOY_USER']
set :deploy_to, ENV['SIPEPA_DEPLOY_PATH']
# La precompilación de assets usa :user.
set :user, fetch(:deploy_user)

server ENV['SIPEPA_DEPLOY_SERVER'],
  user: fetch(:deploy_user),
  roles: %w[app web db]
