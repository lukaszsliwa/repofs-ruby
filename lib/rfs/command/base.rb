class Rfs::Command::Base
  include ActiveModel::Model

  attr_accessor :action

  def default
    :all
  end

  def execute
    self.action = default if action.blank?
    method(action).call
  end

  def save
    if valid?
      execute
    else
      say errors.full_messages.join(".\n")
    end
  end
end