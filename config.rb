##############################################################
# Configurations for Middleman and KSS -                     #
# asset builder, development server and living style guides. #
##############################################################

##
# Middleman
##

set :source,     'styleguide'
set :css_dir,    'stylesheets'
set :js_dir,     'javascripts'
set :images_dir, 'images'

activate :directory_indexes
activate :livereload, port: "35728"
set :file_watcher_ignore, [/^bin(\/|$)/,
                           /^\.bundle(\/|$)/,
                           /^node_modules(\/|$)/,
                           /^\.sass-cache(\/|$)/,
                           /^\.cache(\/|$)/,
                           /^\.git(\/|$)/,
                           /^\.gitignore$/,
                           /\.DS_Store/,
                           /^\.rbenv-.*$/,
                           /^Gemfile$/,
                           /^Gemfile\.lock$/,
                           /~$/,
                           /(^|\/)\.?#/,
                           /^tmp\//,
                           /^build(\/|$)/]

##
# KSS
##

set :markdown_engine, :redcarpet
activate :kss,
         kss_dir: "../assets/stylesheets"

##
# Build-specific configuration
##

configure :build do
  # Change the Compass output style to minify on build
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Use relative URLs
  activate :relative_assets
end

##
# Automatic deploy configuration
##

activate :deploy do |deploy|
  deploy.method = :git
  deploy.build_before = true
end
