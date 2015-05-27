Api::Client.configure do |config|
  config.version = 'v1'
  config.url     = ENV['URL'] || 'http://api.repofs.com'
end