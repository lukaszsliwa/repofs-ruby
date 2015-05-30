class Rfs::Command::Key < Rfs::Command::Base
  attr_accessor :id, :extra

  validates :id, presence: {if: -> { %w(upload show rename delete).include?(self.action) }}

  def self.execute(args, options)
    Rfs::Command::Key.new(action: args[0], id: args[1], extra: args[2]).save
  end

  def all
    keys = Api::Client::Key.all
    keys.each do |key|
      printf "%-40s (%s)\n", key.token, key.created_at.to_datetime.strftime("%Y-%m-%d %H:%M:%S")
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
  rescue ActiveResource::ResourceInvalid => e
    say "The given token `#{extra}` is invalid."
  end

  def delete
    Api::Client::Key.delete id
  end
end