class Rfs::Command::Key < Rfs::Command::Base
  attr_accessor :id

  validates :id, presence: {if: -> { %w(upload delete).include?(self.action) }}

  def self.execute(args, options)
    Rfs::Command::Key.new(action: args[0], id: args[1]).save
  end

  def all
    keys = Api::Client::Key.all(params: {developer_id: ENV['REPOFS_LOGIN'] })
    keys.each do |key|
      say "# Developer: #{ENV['REPOFS_LOGIN']} | Id: #{key.id} | Date: #{key.created_at.to_date}\n"
      say "#{key.content}\n"
    end
    say "\n#{keys.size} key(s)\n"
  end

  def upload
    if File.exists?(id)
      key = Api::Client::Key.new(content: File.read(id))
      key.prefix_options[:developer_id] = ENV['REPOFS_LOGIN']
      key.save
    end
  end

  def delete
    Api::Client::Key.delete id, developer_id: ENV['REPOFS_LOGIN']
  end
end