class Rfs::Command::Setup
  def self.done?
    File.exists?("#{Dir.home}/.repofs")
  end

  def self.execute(args, options)
    if File.exists?("#{Dir.home}/.repofs")
      exit! 0 if choose("You have already configured the repofs before. Do you want re-configure?", 'yes', 'no') == 'no'
    end

    say "Welcome to repofs setup\n"
    say "Please provide your credentials.\n"

    @login = ask "What's your login? " while @login.blank?
    @client_id = password("What's your API client ID? ") while @client_id.blank?
    @client_secret = password("What's your API client secret? ", '*') while @client_secret.blank?
    @access_token = password("What's your API access token? ", '*') while @access_token.blank?
    @refresh_token = password("What's your API refresh token? ", '*') while @refresh_token.blank?
    @host  = ask "What's your repofs domain? (i.e.: git.example.org) " while @host.blank?

    save_settings(@host, @login, @client_id, @client_secret, @access_token, @refresh_token)
  end

  def self.save_settings(host, login, client_id, client_secret, access_token, refresh_token)
    File.open("#{Dir.home}/.repofs", 'w') do |f|
      f.write "repofs:\n"
      f.write "  version: '#{Rfs::VERSION}'\n"
      f.write "  host:    '#{host}'\n"
      f.write "  login:   '#{login}'\n"
      f.write "  client_id: '#{client_id}'\n"
      f.write "  client_secret: '#{client_secret}'\n"
      f.write "  access_token:   '#{access_token}'\n"
      f.write "  refresh_token:  '#{refresh_token}'\n"
    end
  end
end