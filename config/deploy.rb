# config valid for current version and patch releases of Capistrano
lock "~> 3.7.0"

set :application, "CouponMaker"
set :repo_url, "https://github.com/KebabJoy/CouponMaker.git"

set :user, 'root'
set :application, 'CouponMaker'
set :rails_env, 'production'

server '212.41.8.237', user: "root", roles: %w{app db web}, primary: true
set :deploy_to,       "/root/app/CouponMaker"
set :pty, true
set :rvm_custom_path, '/home/deployer/.rvm'

set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml', 'config/puma.rb')
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system', 'public/uploads')

set :config_example_suffix, '.example'
set :config_files, %w{config/database.yml config/secrets.yml}
set :puma_conf, "#{shared_path}/config/puma.rb"

namespace :deploy do
  before 'check:linked_files', 'config:push'
  # before 'check:linked_files', 'puma:config'
  # before 'check:linked_files', 'puma:nginx_config'
  before 'deploy:migrate', 'deploy:db:create'
  after 'puma:smart_restart', 'nginx:restart'
end

