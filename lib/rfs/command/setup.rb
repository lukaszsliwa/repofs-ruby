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
    @token = password("What's your API token? ", '*') while @token.blank?
    @host  = ask "What's your repofs domain? (i.e.: git.example.org) " while @host.blank?

    File.open("#{Dir.home}/.repofs", 'w') do |f|
      f.write "repofs:\n"
      f.write "  version: '#{Rfs::VERSION}'\n"
      f.write "  host:    '#{@host}'\n"
      f.write "  login:   '#{@login}'\n"
      f.write "  token:   '#{@token}'\n"
    end
  end
end