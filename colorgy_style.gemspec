# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'colorgy_style/version'

Gem::Specification.new do |spec|
  spec.name          = "colorgy_style"
  spec.version       = ColorgyStyle::VERSION
  spec.authors       = ["Neson"]
  spec.email         = ["neson@dex.tw"]

  spec.summary       = %q{The front-end bundle and style guide for Colorgy.}
  spec.description   = %q{The front-end bundle and style guide for Colorgy.}
  spec.homepage      = "https://github.com/colorgy/Style"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  # if spec.respond_to?(:metadata)
  #   spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  # else
  #   raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  # end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"

  # Use Middleman to construct living style guides
  spec.add_development_dependency "middleman", ">= 3"
  spec.add_development_dependency "middleman-kss", "~>0.3.1"
  spec.add_development_dependency "middleman-livereload", "~> 3.1.0"
  spec.add_development_dependency "middleman-deploy", "~> 1.0"

  spec.add_development_dependency "jquery-rails"

  # SASS and Compass
  spec.add_dependency "sass", ">= 3.4"
  spec.add_dependency "sass-globbing"
  spec.add_dependency "compass", "~> 1.0.0"

  # Sprockets
  spec.add_dependency "sprockets", "~> 2.0"

  # Assets
  spec.add_dependency "bootstrap-sass", "~> 3.3.4.1"
  spec.add_dependency "materialize-sass"
  spec.add_dependency "turbolinks", "~> 2.5.3"
end
