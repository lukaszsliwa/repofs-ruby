require 'commander/import'

Commander.configure do
  never_trace!

  program :version, Rfs::VERSION
  program :description, 'RepoFS Command Line Interface'

  default_command :repository

  command :install do |c|
    c.syntax = 'rfs install'
    c.summary = ''
    c.description = ''
    c.example 'Generate configuration file', '$ rfs install'
    c.action do |args, options|
      Rfs::Command::Setup.execute(args, options)
    end
  end

  command :repository do |c|
    c.syntax = 'rfs repository [options]'
    c.summary = 'Manage repositories'
    c.description = 'Provides possibility to display, create and delete repositories'
    c.example 'List all repositories', '$ rfs repository'
    c.example 'Create new repository in the repofs space', '$ rfs repository create repofs/app'
    c.example 'Delete an example app repository from the repofs space', '$ rfs repository delete repofs/app'
    c.action do |args, options|
      Rfs::Command::Repository.execute(args, options)
    end
  end
  alias_command :r, :repository
  alias_command :repo, :repository
  alias_command :repos, :repository
  alias_command :repositories, :repository

  command :developer do |c|
    c.syntax = 'rfs developer [options]'
    c.summary = 'Manage developers'
    c.description = 'Provides possibility to display, allow, deny, create and delete developers'
    c.example 'List all developers',  '$ rfs developer'
    c.example 'Create new developer', '$ rfs developer create [login] [e-mail]'
    c.example 'Delete a developer',   '$ rfs developer delete [login]'
    c.example 'Permit a developer to read and write a repository', '$ rfs developer allow [login] [repository]'
    c.example 'Remove an access to a repository', '$ rfs developer deny [login] [repository]'
    c.action do |args, options|
      Rfs::Command::Developer.execute(args, options)
    end
  end
  alias_command :d, :developer
  alias_command :dev, :developer
  alias_command :devs, :developer
  alias_command :developers, :developer
  alias_command :u, :developer
  alias_command :user, :developer
  alias_command :users, :developer

  command :space do |c|
    c.syntax = 'rfs space [options]'
    c.summary = 'Manage spaces'
    c.description = 'Manage spaces'
    c.example 'List all spaces',  '$ rfs space'
    c.example 'Create new space', '$ rfs space create [handle]'
    c.example 'Delete a space',   '$ rfs space delete [handle]'
    c.action do |args, options|
      Rfs::Command::Space.execute(args, options)
    end
  end
  alias_command :s, :space
  alias_command :spaces, :space

  command :key do |c|
    c.syntax = 'rfs key [options]'
    c.summary = 'Authorization keys management'
    c.description = ''
    c.example 'List your keys', '$ rfs key'
    c.example 'Upload a new key', "$ rfs key upload #{Dir.home}/.ssh/id_rsa.pub"
    c.example 'Show a key', '$ rfs key show f9a45ba11c61e01f6ed0cd4cfc2ea2c1'
    c.example 'Re-name a key', '$ rfs key rename f9a45ba11c61e01f6ed0cd4cfc2ea2c1 new-name'
    c.example 'Delete a key', '$ rfs key delete f9a45ba11c61e01f6ed0cd4cfc2ea2c1'
    c.action do |args, options|
      Rfs::Command::Key.execute(args, options)
    end
  end
  alias_command :k, :key
  alias_command :keys, :key
end