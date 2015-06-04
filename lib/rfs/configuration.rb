require 'rubygems'
require 'api-client'

if Rfs::Command::Setup.done?
  ENV['REPOFS_LOGIN']  ||= Rfs::Settings.login
  ENV['REPOFS_TOKEN'] ||= Rfs::Settings.token
  ENV['REPOFS_HOST']   ||= Rfs::Settings.host

  Api::Client.configure do |config|
    config.version = 'v1'
    config.url     = "http://#{ENV['REPOFS_HOST'] || 'api.repofs.com'}"
    config.token = ENV['REPOFS_TOKEN']
  end
end