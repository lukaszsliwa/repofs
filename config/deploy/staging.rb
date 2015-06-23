set :rails_env, 'staging'

server 'repofs.staging.apptamers.com', user: 'www', roles: %w{app db web}