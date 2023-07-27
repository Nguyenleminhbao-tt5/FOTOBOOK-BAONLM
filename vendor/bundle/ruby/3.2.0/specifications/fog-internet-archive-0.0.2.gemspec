# -*- encoding: utf-8 -*-
# stub: fog-internet-archive 0.0.2 ruby lib

Gem::Specification.new do |s|
  s.name = "fog-internet-archive".freeze
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Nat Welch".freeze]
  s.date = "2020-10-02"
  s.email = ["nat@natwelch.com".freeze]
  s.homepage = "https://github.com/fog/fog-internet-archive".freeze
  s.licenses = ["MIT".freeze]
  s.rubygems_version = "3.4.10".freeze
  s.summary = "Module for the 'fog' gem to support Internet Archive.".freeze

  s.installed_by_version = "3.4.10" if s.respond_to? :installed_by_version

  s.specification_version = 4

  s.add_runtime_dependency(%q<fog-core>.freeze, [">= 0"])
  s.add_runtime_dependency(%q<fog-json>.freeze, [">= 0"])
  s.add_runtime_dependency(%q<fog-xml>.freeze, [">= 0"])
  s.add_development_dependency(%q<rake>.freeze, [">= 0"])
  s.add_development_dependency(%q<shindo>.freeze, [">= 0"])
  s.add_development_dependency(%q<pry>.freeze, [">= 0"])
  s.add_development_dependency(%q<vcr>.freeze, [">= 0"])
  s.add_development_dependency(%q<webmock>.freeze, [">= 0"])
  s.add_development_dependency(%q<coveralls>.freeze, [">= 0"])
  s.add_development_dependency(%q<rubocop>.freeze, [">= 0"])
  s.add_development_dependency(%q<mime-types>.freeze, [">= 0"])
end
