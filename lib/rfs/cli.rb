require 'commander/import'

Commander.configure do
  program :version, Rfs::VERSION
  program :description, 'RepoFS Command Line Interface'

  command :install do |c|
    c.syntax = 'rfs install'
    c.summary = ''
    c.description = ''
    c.example 'Generate configuration file', '$ rfs install'
    c.action do |args, options|
      Rfs::Command::Setup.execute(args, options)
    end
  end

  command :repositories do |c|
    c.syntax = 'rfs repositories [options]'
    c.summary = 'Manage repositories'
    c.description = 'Provides possibility to display, create and delete repositories'
    c.example 'List all repositories', '$ rfs repositories'
    c.example 'Create new repository in the repofs space', '$ rfs repositories create repofs/app'
    c.example 'Delete an example app repository from the repofs space', '$ rfs repositories delete repofs/app'
    c.action do |args, options|
      Rfs::Command::Repository.execute(args, options)
    end
  end

  command :developers do |c|
    c.syntax = 'rfs developers [options]'
    c.summary = 'Manage developers'
    c.description = 'Provides possibility to display, allow, deny, create and delete developers'
    c.example 'List all developers',  '$ rfs developers'
    c.example 'Create new developer', '$ rfs developers create [login] [e-mail]'
    c.example 'Delete a developer',   '$ rfs developers delete [login]'
    c.example 'Permit a developer to read and write a repository', '$ rfs developers allow [login] [repository]'
    c.example 'Remove an access to a repository', '$ rfs developers deny [login] [repository]'
    c.action do |args, options|
      Rfs::Command::Developer.execute(args, options)
    end
  end

  command :spaces do |c|
    c.syntax = 'rfs spaces [options]'
    c.summary = 'Manage spaces'
    c.description = 'Manage spaces'
    c.example 'List all spaces',  '$ rfs spaces'
    c.example 'Create new space', '$ rfs spaces create [handle]'
    c.example 'Delete a space',   '$ rfs spaces delete [handle]'
    c.action do |args, options|
      Rfs::Command::Space.execute(args, options)
    end
  end

  command :keys do |c|
    c.syntax = 'rfs keys [options]'
    c.summary = 'Authorization keys management'
    c.description = ''
    c.example 'description', 'command example'
    c.action do |args, options|
      Rfs::Command::Key.execute(args, options)
    end
  end
end