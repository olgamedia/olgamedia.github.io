require "bundler/setup"
Bundler.require(:default)
configure(:development) do
  set :server, :puma
  set :port, 8080
  set :environment, :development

  set :cache_enabled, true
  set :cache_output_dir, "#{settings.root}/public/cache"

  set :bind, "0.0.0.0"

  DataMapper.setup :default, {
    :adapter  => "postgres",
    :database => "olga_media_development",
    :user     => "peter"
  }

  Dir["lib/*"].each {|file| load file }

  DataMapper.finalize.auto_upgrade!
end

configure(:production) do
  set :server, :puma
  set :port, 80
  set :environment, :production

  set :cache_enabled, true
  set :cache_output_dir, "#{settings.root}/public/cache"

  DataMapper.setup :default, {
    :adapter  => "postgres",
    :database => ENV["DATABASE_URL"],
    :user     => ENV["DATABASE_USER"],
    :password => ENV["DATABASE_PASS"]
  }

  Dir["lib/*.rb"].each {|file| require file }

  DataMapper.finalize.auto_upgrade!
end

require "./app"
run Sinatra::Application.run!