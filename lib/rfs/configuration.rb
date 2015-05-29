if Rfs::Command::Setup.done?
  ENV['REPOFS_LOGIN']  ||= Rfs::Settings.login
  ENV['REPOFS_AUTHORIZATION_KEY'] ||= Rfs::Settings.credentials.key
  ENV['REPOFS_SECRET_TOKEN']      ||= Rfs::Settings.credentials.secret
  ENV['REPOFS_HOST']   ||= Rfs::Settings.host

  Api::Client.configure do |config|
    config.version = 'v1'
    config.url     = "http://#{ENV['REPOFS_HOST'] || 'api.repofs.com'}"
  end
end