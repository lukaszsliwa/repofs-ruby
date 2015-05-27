require 'commander/import'

Commander.configure do
  program :version, Rfs::VERSION
  program :description, 'Repository manager'

  command :configure do |c|
    c.syntax = 'rfs install'
    c.summary = ''
    c.description = ''
    c.example 'description', 'command example'
    c.action do

    end
  end

  command :repositories do |c|
    c.syntax = 'rfs repositories [options]'
    c.summary = ''
    c.description = ''
    c.example 'description', 'command example'
    c.option '--some-switch', 'Some switch that does something'
    c.action do |args, options|
      if args.size > 1
        case args[0]
        when 'create'
          if (repository = Api::Client::Repository.new(handle: args[1], name: args[1])).save
            say "#{repository.handle} was successfully created.\n"
          else
            say repository.errors.full_messages.join "\n"
          end
        when 'delete'
          begin
            Api::Client::Repository.delete args[1]
          rescue
            say "Repository does not exist.\n"
          end
        else
          say "Command `#{args[0]}` not found.\n"
        end
      elsif args.size == 1
        say "Please provide the repository ID.\n"
      else
        repositories = Api::Client::Repository.all
        spaces = repositories.map {|repository| repository.handle.length }.max
        repositories.each do |repository|
          printf "%-#{spaces + 10}s (%s)\n", repository.handle, repository.created_at.to_date
        end
        say "\n"
      end
    end
  end

  command :developers do |c|
    c.syntax = 'rfs developers [options]'
    c.summary = ''
    c.description = 'Display all developers'
    c.example 'description', 'command example'
    c.option '--some-switch', 'Some switch that does something'
    c.action do |args, options|

    end
  end

  command :spaces do |c|
    c.syntax = 'rfs spaces [options]'
    c.summary = ''
    c.description = ''
    c.example 'description', 'command example'
    c.option '--some-switch', 'Some switch that does something'
    c.action do |args, options|

    end
  end

  command :keys do |c|
    c.syntax = 'rfs keys [options]'
    c.summary = ''
    c.description = ''
    c.example 'description', 'command example'
    c.option '--some-switch', 'Some switch that does something'
    c.action do |args, options|

    end
  end
end