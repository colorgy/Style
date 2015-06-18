require "colorgy_style/version"

module ColorgyStyle
  # Give credit to bootstrap-sass
  class << self
    # Inspired by Kaminari
    def load!
      if rails?
        register_rails_engine
      elsif sprockets?
        register_sprockets
      end

      configure_sass
    end

    # Paths

    def gem_path
      @gem_path ||= File.expand_path '..', File.dirname(__FILE__)
    end

    def assets_path
      @assets_path ||= File.join gem_path, 'assets'
    end

    def images_path
      File.join assets_path, 'images'
    end

    def stylesheets_path
      File.join assets_path, 'stylesheets'
    end

    def fonts_path
      File.join assets_path, 'fonts'
    end

    def javascripts_path
      File.join assets_path, 'javascripts'
    end

    # Environment detection helpers

    def sprockets?
      defined?(::Sprockets)
    end

    def rails?
      defined?(::Rails)
    end

    private

    def configure_sass
      require 'sass'

      ::Sass.load_paths << stylesheets_path
    end

    def register_rails_engine
      require 'colorgy_style/rails'
    end

    def register_sprockets
      Sprockets.append_path(images_path)
      Sprockets.append_path(stylesheets_path)
      Sprockets.append_path(fonts_path)
      Sprockets.append_path(javascripts_path)
    end
  end
end

ColorgyStyle.load!

require 'bootstrap-sass'
require 'materialize-sass'
require 'sass-globbing' unless defined?(Rails::VERSION::STRING) &&
                               Rails::VERSION::STRING.to_f >= 3.1
