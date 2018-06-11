class Rfs::Command::Space < Rfs::Command::Base
  attr_accessor :handle, :name

  validates :handle, format: { with: /\A[a-z0-9][a-z0-9\-]+[a-z0-9]\Z/ }, presence: true, if: -> { %w(create delete).include?(self.action) }

  def self.execute(args, options)
    Rfs::Command::Space.new(action: args[0], handle: args[1], name: args[1]).save
  end

  def all
    spaces = Api::Client::Space.all
    spaces.each do |space|
      say "#{space.handle}\n"
    end
    say "\n#{spaces.size} space(s)\n"
  end

  def create
    Api::Client::Space.create(handle: handle, name: name)
  end

  def delete
    Api::Client::Space.delete handle
  end
end