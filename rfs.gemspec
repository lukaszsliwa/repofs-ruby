# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: rfs 1.0.0 ruby lib

Gem::Specification.new do |s|
  s.name = "rfs"
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["\u{141}ukasz \u{15a}liwa"]
  s.date = "2015-05-29"
  s.description = "Provides possibility to manage the repositories"
  s.email = "lukasz.sliwa@apptamers.com"
  s.executables = ["rfs", "repofs"]
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.rdoc",
    "Rakefile",
    "bin/rfs",
    "lib/rfs.rb",
    "lib/rfs/cli.rb",
    "lib/rfs/command/base.rb",
    "lib/rfs/command/developer.rb",
    "lib/rfs/command/key.rb",
    "lib/rfs/command/repository.rb",
    "lib/rfs/command/setup.rb",
    "lib/rfs/command/space.rb",
    "lib/rfs/configuration.rb",
    "lib/rfs/settings.rb",
    "rfs.gemspec",
    "test/helper.rb",
    "test/test_rfs.rb"
  ]
  s.homepage = "http://git.apptamers.com/repohub/rfs"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.2.2"
  s.summary = "RepoFS CLI"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<api-client>, [">= 0"])
      s.add_runtime_dependency(%q<commander>, [">= 0"])
      s.add_runtime_dependency(%q<settingslogic>, [">= 0"])
      s.add_development_dependency(%q<bundler>, ["~> 1.0"])
      s.add_development_dependency(%q<jeweler>, ["~> 2.0.1"])
    else
      s.add_dependency(%q<api-client>, [">= 0"])
      s.add_dependency(%q<commander>, [">= 0"])
      s.add_dependency(%q<settingslogic>, [">= 0"])
      s.add_dependency(%q<bundler>, ["~> 1.0"])
      s.add_dependency(%q<jeweler>, ["~> 2.0.1"])
    end
  else
    s.add_dependency(%q<api-client>, [">= 0"])
    s.add_dependency(%q<commander>, [">= 0"])
    s.add_dependency(%q<settingslogic>, [">= 0"])
    s.add_dependency(%q<bundler>, ["~> 1.0"])
    s.add_dependency(%q<jeweler>, ["~> 2.0.1"])
  end
end

