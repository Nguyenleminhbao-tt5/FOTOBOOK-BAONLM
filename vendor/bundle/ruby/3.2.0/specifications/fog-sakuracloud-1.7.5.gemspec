# -*- encoding: utf-8 -*-
# stub: fog-sakuracloud 1.7.5 ruby lib

Gem::Specification.new do |s|
  s.name = "fog-sakuracloud".freeze
  s.version = "1.7.5"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["sawanoboly".freeze]
  s.date = "2015-12-26"
  s.description = "Module for the 'fog' gem to support Sakura no Cloud".freeze
  s.email = ["sawanoboriyu@higanworks.com".freeze]
  s.homepage = "".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.4.10".freeze
  s.summary = "Module for the 'fog' gem to support Sakura no Cloud".freeze

  s.installed_by_version = "3.4.10" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<fog-core>.freeze, [">= 0"])
  s.add_runtime_dependency(%q<fog-json>.freeze, [">= 0"])
  s.add_development_dependency(%q<bundler>.freeze, ["~> 1.5"])
  s.add_development_dependency(%q<minitest>.freeze, [">= 0"])
  s.add_development_dependency(%q<rake>.freeze, [">= 0"])
  s.add_development_dependency(%q<rbvmomi>.freeze, [">= 0"])
  s.add_development_dependency(%q<yard>.freeze, [">= 0"])
  s.add_development_dependency(%q<thor>.freeze, [">= 0"])
  s.add_development_dependency(%q<rbovirt>.freeze, ["= 0.0.24"])
  s.add_development_dependency(%q<shindo>.freeze, ["~> 0.3.4"])
  s.add_development_dependency(%q<fission>.freeze, [">= 0"])
  s.add_development_dependency(%q<pry>.freeze, [">= 0"])
  s.add_development_dependency(%q<rubocop>.freeze, [">= 0"])
end
