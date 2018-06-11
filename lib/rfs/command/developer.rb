class Rfs::Command::Developer < Rfs::Command::Base
  attr_accessor :login, :email, :space_id, :repository_id

  validates :email, presence: true, if: -> { self.action == 'create' }
  validates :login, format: { with: /\A[a-z0-9][a-z0-9\-]+[a-z0-9]\Z/ }, presence: true, if: -> { %w(create delete allow deny).include?(self.action) }

  def self.execute(args, options)
    items = (args[2] || '').split '/'
    if items.size == 2
      space_id, repository_id = items[0], items[1]
    elsif items.size == 1
      space_id, repository_id = nil, items[0]
    elsif items.size > 2
      space_id, repository_id = items[0], items[1..(items.size - 1)].join('/')
    else
      space_id, repository_id = nil, nil
    end
    Rfs::Command::Developer.new(action: args[0], login: args[1], email: args[2], space_id: space_id, repository_id: repository_id).save
  end

  def all
    space_handle, repository_id = (login || '').split('/')
    developers = Api::Client::Developer.all(space_handle: space_handle, repository_id: repository_id)
    admins_count = 0
    developers.each do |developer|
      star = developer.admin ? '#' : '*'
      admins_count += 1 if developer.admin
      printf "%s %-20s (%s)\n", star, developer.login, developer.email
    end
    say "\n#{developers.size} developer(s)   #{admins_count} admin(s)\n"
  end

  def create
    Api::Client::Developer.create(login: login, email: email)
  end

  def delete
    Api::Client::Developer.delete login
  end

  def allow
    Api::Client::Developer.allow login, [space_id, repository_id].join('/')
  end

  def deny
    Api::Client::Developer.deny login, [space_id, repository_id].join('/')
  end
end