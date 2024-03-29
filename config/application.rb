require File.expand_path('../boot', __FILE__)

require "action_controller/railtie"
require "action_mailer/railtie"
require "sprockets/railtie"
require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)


module FChat
  class Application < Rails::Application

    if ENV['RAILS_ENV'] != 'production'
      puts "WARNING:  "
      puts "   You are running in #{ENV['RAILS_ENV']} mode, faye is offline!"
      puts
    else
      config.middleware.use Faye::RackAdapter, :mount => '/faye', :timeout => 25  do |bayeux|
        bayeux.add_extension("FChat::FayeJoy.new")
      end
    end




  end
end
