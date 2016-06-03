require "bundler/setup"
Bundler.require(:default)

configure(:development) do
  load "data.rb"
  set :server, :puma
  set :port, 8080
  set :environment, :development
end

configure(:production) do
  load "data.rb"
  set :server, :puma
  set :port, 80
  set :environment, :production
end

require "./app"
run Sinatra::Application.run!