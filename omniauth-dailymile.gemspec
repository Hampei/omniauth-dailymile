# -*- encoding: utf-8 -*-
require File.expand_path('../lib/omniauth-dailymile/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Henk van der Veen"]
  gem.email         = ["henk@vanderveen.name"]
  gem.description   = %q{OmniAuth strategy for DailyMile.}
  gem.summary       = %q{OmniAuth strategy for DailyMile.}
  gem.homepage      = "https://github.com/hampei/omniauth-dailymile"

  gem.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  gem.files         = `git ls-files`.split("\n")
  gem.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  gem.name          = "omniauth-dailymile"
  gem.require_paths = ["lib"]
  gem.version       = OmniAuth::DailyMile::VERSION

  gem.add_dependency 'omniauth', '~> 1.0'
  gem.add_dependency 'omniauth-oauth2', '~> 1.0'
  gem.add_dependency 'multi_json', '~> 1.0'

  gem.add_development_dependency 'rspec', '~> 2.7'
  gem.add_development_dependency 'rack-test'
  gem.add_development_dependency 'simplecov'
  gem.add_development_dependency 'webmock'
end
