require File.expand_path("../boot", __FILE__)

require "rails/all"

Bundler.require(*Rails.groups)

module Api
  class Application < Rails::Application
    config.browserify_rails.commandline_options = "-t coffeeify --extension=\".js.coffee\""

    config.assets.paths << Rails.root.join("public", "assets", "stylesheets")
    config.assets.paths << Rails.root.join("public", "assets", "javascripts")

    config.middleware.use Rack::Cors do
      allow do
        origins "*"
        resource "*", headers: :any, methods: [:get, :post, :put, :delete, :options]
      end
    end
  end
end
