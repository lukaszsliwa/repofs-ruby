class Rfs::Command::Repository < Rfs::Command::Base
  attr_accessor :name, :handle, :space_id

  validates :action, inclusion: {in: %w(all create delete developers), allow_blank: true }
  validates :handle, format: { with: /\A[a-z0-9][a-z0-9\-]+[a-z0-9]\Z/ }, presence: true, if: -> { %w(create delete developers).include?(self.action) }

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
    Rfs::Command::Repository.new(action: action, name: name, handle: handle, space_id: space_id).save
  end

  def all
    repositories = Api::Client::Repository.all
    spaces = repositories.map {|repository| repository.handle.length }.max
    repositories.each do |repository|
      printf "%-#{spaces + 10}s (%s@%s:%s)\n", repository.handle_with_space, ENV['REPOFS_LOGIN'], ENV['REPOFS_HOST'], repository.path
    end
    say "\n#{repositories.size} repositories\n"
  end

  def developers
    repository = Api::Client::Repository.find handle
    repository_developers = repository.users
    spaces = repository_developers.map {|developer| developer.login.length }.max
    repository_developers.each do |developer|
      star = developer.admin ? '*' : ' '
      printf "%s %-#{spaces + 10}s\n", star, developer.login
    end
    say "\n#{repository_developers.size} developer(s) in #{handle}\n"
  end

  def create
    Api::Client::Repository.create(handle: handle, name: name, space_id: space_id)
  end

  def delete
    Api::Client::Repository.delete handle
  end
end