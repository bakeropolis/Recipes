#require './site'
path = File.expand_path "../", __FILE__
require './config/environment'
require 'sinatra'
#if ActiveRecord::Migrator.needs_migration?
#  raise 'Migrations are pending. Run `rake db:migrate` to resolve this issue'
#end

use Rack::MethodOverride
run ApplicationController
#run Sinatra::Application
