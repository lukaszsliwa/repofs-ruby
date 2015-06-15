class Rfs::Command::Repository < Rfs::Command::Base
  attr_accessor :name, :handle, :space_id, :allow_me

  validates :action, inclusion: {in: %w(all create delete), allow_blank: true }
  validates :handle, format: { with: /\A[a-z0-9][a-z0-9\-]+[a-z0-9]\Z/ }, presence: true, if: -> { %w(create delete).include?(self.action) }

  def self.execute(args, options)
    action, handle_with_space = args[0], args[1]
    items = handle_with_space.nil? ? [] : handle_with_space.split('/')
    if items.size == 2
      space_id, handle = items[0], items[1]
    elsif items.size == 1
      space_id, handle = nil, items[0]
    elsif items.size > 2
      space_id, handle = items[0], items[1..(items.size - 1)].join('/')
    else
      space_id, handle = nil, nil
    end

    Rfs::Command::Repository.new(action: action, name: name, handle: handle, space_id: space_id, allow_me: options.allow_me).save
  end

  def all
    repositories = Api::Client::Repository.all
    spaces = repositories.map {|repository| repository.handle.length }.max
    repositories.each do |repository|
      if repository.allowed
        description = "%{login}@%{host}:%{path}" % {login: ENV['REPOFS_LOGIN'], host: ENV['REPOFS_HOST'], path: repository.path}
      else
        description = ""
      end
      printf "* %-#{spaces + 10}s (%s) %s\n", repository.handle_with_space, repository.users_count, description
    end
    say "\n#{repositories.size} repositories\n"
  end

  def create
    Api::Client::Repository.create(handle: handle, name: name, space_handle: space_id)
    if allow_me
      Api::Client::Developer.allow ENV['REPOFS_LOGIN'], [space_id, handle].join('/')
    end
  end

  def delete
    Api::Client::Repository.delete handle, {space_handle: space_id}
  end
end