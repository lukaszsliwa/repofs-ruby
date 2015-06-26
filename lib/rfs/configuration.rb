require 'rubygems'
require 'api-client'

if Rfs::Command::Setup.done?
  ENV['REPOFS_LOGIN']  ||= Rfs::Settings.login
  ENV['REPOFS_CLIENT_ID'] ||= Rfs::Settings.client_id
  ENV['REPOFS_CLIENT_SECRET'] ||= Rfs::Settings.client_secret
  ENV['REPOFS_ACCESS_TOKEN'] ||= Rfs::Settings.access_token
  ENV['REPOFS_REFRESH_TOKEN'] ||= Rfs::Settings.refresh_token
  ENV['REPOFS_HOST']   ||= Rfs::Settings.host

  Api::Client.configure do |config|
    config.version = 'v1'
    config.url     = "http://#{ENV['REPOFS_HOST']}/api"
    config.client_id = ENV['REPOFS_CLIENT_ID']
    config.client_secret = ENV['REPOFS_CLIENT_SECRET']
    config.access_token = ENV['REPOFS_ACCESS_TOKEN']
    config.refresh_token = ENV['REPOFS_REFRESH_TOKEN']
  end
end