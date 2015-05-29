class Rfs::Command::Developer < Rfs::Command::Base
  attr_accessor :login, :email, :repository_id

  validates :email, presence: {if: -> { self.action == 'create' }}
  validates :login, presence: {if: -> { %w(create delete allow deny).include?(self.action) }}

  def self.execute(args, options)
    Rfs::Command::Developer.new(action: args[0], login: args[1], email: args[2], repository_id: args[2]).save
  end

  def all
    developers = Api::Client::Developer.all
    developers.each do |developer|
      printf "%-20s (%s)\n", developer.login, developer.email
    end
    say "\n#{developers.size} developer(s)\n"
  end

  def create
    Api::Client::Developer.create(login: login, email: email)
  end

  def delete
    Api::Client::Developer.delete login
  end

  def allow
    Api::Client::Developer.allow login, repository_id
  end

  def deny
    Api::Client::Developer.deny login, repository_id
  end
end