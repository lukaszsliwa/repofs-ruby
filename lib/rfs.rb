require 'active_support'
require 'api-client'

module Rfs
  VERSION = '1.0.0'
  extend ActiveSupport::Autoload

  autoload :Settings, 'rfs/settings'

  module Command
    extend ActiveSupport::Autoload

    autoload :Base,       'rfs/command/base'
    autoload :Repository, 'rfs/command/repository'
    autoload :Developer,  'rfs/command/developer'
    autoload :Space,      'rfs/command/space'
    autoload :Key,        'rfs/command/key'
    autoload :Setup,      'rfs/command/setup'
  end
end
