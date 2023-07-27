# -*- encoding: utf-8 -*-
# stub: fog-terremark 0.1.0 ruby lib

Gem::Specification.new do |s|
  s.name = "fog-terremark".freeze
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Paulo Henrique Lopes Ribeiro".freeze]
  s.date = "2015-04-04"
  s.description = "                         This library can be used as a module for `fog` or\n                         as standalone provider to use the Terremark vCloud in\n                         applications.\n".freeze
  s.email = ["plribeiro3000@gmail.com".freeze]
  s.homepage = "".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.4.10".freeze
  s.summary = "Module for the 'fog' gem to support Terremark vCloud.".freeze

  s.installed_by_version = "3.4.10" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<fog-core>.freeze, [">= 0"])
  s.add_runtime_dependency(%q<fog-xml>.freeze, [">= 0"])
  s.add_development_dependency(%q<rake>.freeze, [">= 0"])
  s.add_development_dependency(%q<minitest>.freeze, [">= 0"])
  s.add_development_dependency(%q<turn>.freeze, [">= 0"])
  s.add_development_dependency(%q<pry>.freeze, [">= 0"])
  s.add_development_dependency(%q<vcr>.freeze, [">= 0"])
  s.add_development_dependency(%q<coveralls>.freeze, [">= 0"])
  s.add_development_dependency(%q<rubocop>.freeze, [">= 0"])
end
