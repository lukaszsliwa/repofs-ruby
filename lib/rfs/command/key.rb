class Rfs::Command::Key < Rfs::Command::Base
  attr_accessor :id, :extra

  validates :id, format: { with: /\A[a-zA-Z0-9\-\_\/\~\.]+\Z/ }, presence: true, if: -> { self.action == 'upload' }
  validates :id, format: { with: /\A[a-z0-9][a-z0-9\-]+[a-z0-9]\Z/ }, presence: true, if: -> { %w(show rename delete).include?(self.action) }

  def self.execute(args, options)
    Rfs::Command::Key.new(action: args[0], id: args[1], extra: args[2]).save
  end

  def all
    keys = Api::Client::Key.all
    keys.each do |key|
      printf "%-40s (%s)\n", key.token, DateTime.parse(key.created_at).strftime("%Y-%m-%d %H:%M:%S")
    end
    say "\n#{keys.size} key(s)\n"
  end

  def show
    key = Api::Client::Key.find id
    say key.content
  end

  def upload
    Api::Client::Key.create(content: File.read(id)) if File.exists?(id)
  end

  def rename
    Api::Client::Key.put id, token: extra
  end

  def delete
    Api::Client::Key.delete id
  end
end