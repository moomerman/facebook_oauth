# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{facebook_oauth}
  s.version = "0.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Richard Taylor"]
  s.date = %q{2011-11-03}
  s.description = %q{facebook_oauth is a Ruby client library for the Facebook OAuth Graph API}
  s.email = %q{moomerman@gmail.com}
  s.files = ["LICENSE", "README.textile","lib/facebook_oauth.rb"] + Dir.glob('lib/facebook_oauth/*.rb')
  s.has_rdoc = false
  s.homepage = %q{http://github.com/moomerman/facebook_oauth}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{facebook_oauth}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{facebook_oauth is a Ruby client library for the Facebook OAuth Graph API}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<oauth2>, [">= 0.5.1"])
      s.add_runtime_dependency(%q<json>, [">= 1.5.3"])
      s.add_runtime_dependency(%q<mime-types>, [">= 1.16"])
      %w(shoulda mocha).each do |dep|
        s.add_development_dependency dep
      end
    else
      s.add_dependency(%q<oauth2>, [">= 0.5.1"])
      s.add_dependency(%q<json>, [">= 1.5.3"])
      s.add_dependency(%q<mime-types>, [">= 1.16"])
    end
  else
    s.add_dependency(%q<oauth2>, [">= 0.5.1"])
    s.add_dependency(%q<json>, [">= 1.5.3"])
    s.add_dependency(%q<mime-types>, [">= 1.16"])
  end
end
