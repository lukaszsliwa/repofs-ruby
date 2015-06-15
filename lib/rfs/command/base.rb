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
      result = execute
      if result.present? && result.respond_to?(:errors) && (errors = result.errors).present?
        say errors.full_messages.join(".\n")
      end
    else
      say self.errors.full_messages.join(".\n")
    end
  end
end