require 'settingslogic'

class Rfs::Settings < Settingslogic
  source "#{Dir.home}/.repofs"
  suppress_errors true
  namespace 'repofs'
end