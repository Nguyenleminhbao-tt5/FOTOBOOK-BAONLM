# -*- encoding: utf-8 -*-
# stub: fog-softlayer 1.1.4 ruby lib

Gem::Specification.new do |s|
  s.name = "fog-softlayer".freeze
  s.version = "1.1.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Matt Eldridge".freeze]
  s.date = "2016-08-28"
  s.description = "Module for the 'fog' gem to support SoftLayer Cloud".freeze
  s.email = ["matt.eldridge@us.ibm.com".freeze]
  s.homepage = "https://github.com/fog/fog-softlayer".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.4.10".freeze
  s.summary = "This library can be used as a module for `fog` or as standalone provider to use the SoftLayer Cloud in applications".freeze

  s.installed_by_version = "3.4.10" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<fog-core>.freeze, [">= 0"])
  s.add_runtime_dependency(%q<fog-json>.freeze, [">= 0"])
  s.add_development_dependency(%q<minitest>.freeze, [">= 0"])
  s.add_development_dependency(%q<rake>.freeze, [">= 0"])
  s.add_development_dependency(%q<rbvmomi>.freeze, [">= 0"])
  s.add_development_dependency(%q<yard>.freeze, [">= 0"])
  s.add_development_dependency(%q<thor>.freeze, [">= 0"])
  s.add_development_dependency(%q<rbovirt>.freeze, ["= 0.0.24"])
  s.add_development_dependency(%q<shindo>.freeze, ["~> 0.3.4"])
  s.add_development_dependency(%q<fission>.freeze, [">= 0"])
  s.add_development_dependency(%q<pry>.freeze, [">= 0"])
  s.add_development_dependency(%q<osrcry>.freeze, [">= 0"])
end
