# register_rails_engine
module ColorgyStyle
  module Rails
    class Engine < ::Rails::Engine
      initializer 'colorgy_style.assets.precompile' do |app|
        %w(stylesheets javascripts fonts images).each do |sub|
          app.config.assets.paths << root.join('assets', sub).to_s
        end
        app.config.assets.precompile << %r(colorgy/.+\.(?:png|gif|jpg|eot|svg|ttf|woff|woff2)$)
      end
    end
  end
end
