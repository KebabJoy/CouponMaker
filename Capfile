require 'capistrano/setup'
require 'capistrano/deploy'
require 'capistrano/nginx'
require 'capistrano/puma'
require 'capistrano/puma/nginx'
require 'capistrano/rvm'
require 'capistrano/rails'
require 'capistrano/rails/db'
require 'capistrano/rails/console'
require 'capistrano/upload-config'
require 'sshkit/sudo'
require "capistrano/scm/git"

install_plugin Capistrano::SCM::Git
install_plugin Capistrano::Puma  # Default puma tasks
install_plugin Capistrano::Puma::Systemd

Dir.glob('lib/capistrano/tasks/*.rake').each { |r| import r }
