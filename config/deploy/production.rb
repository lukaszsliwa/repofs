set :rails_env, 'production'

server '92.222.92.4', user: 'www', roles: %w{app db web}
