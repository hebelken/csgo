require File.expand_path("../boot", __FILE__)

require "rails/all"

Bundler.require(*Rails.groups)

module Api
  class Application < Rails::Application
    # For Gulp
    config.assets.paths << Rails.root.join("public", "assets", "stylesheets")
    config.assets.paths << Rails.root.join("public", "assets", "javascripts")

    # Bower in pipeline
    root.join('vendor', 'assets', 'bower_components').to_s.tap do |bower_path|
      config.sass.load_paths << bower_path
      config.assets.paths << bower_path
    end

    # Precompile Bootstrap fonts
    config.assets.precompile << %r(bootstrap-sass/assets/fonts/bootstrap/[\w-]+\.(?:eot|svg|ttf|woff2?)$)

    # Minimum Sass number precision required by bootstrap-sass
    ::Sass::Script::Number.precision = [8, ::Sass::Script::Number.precision].max

    # CORS Protection
    config.middleware.use Rack::Cors do
      allow do
        origins "*"
        resource "*", headers: :any, methods: [:get, :post, :put, :delete, :options]
      end
    end
  end
end
