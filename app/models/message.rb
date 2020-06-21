class Message < ApplicationRecord
  belongs_to :recipient, class_name: 'User'
  belongs_to :sender, class_name: 'User'

  def self.default_scope
    where(created_at: 30.days.ago..Time.current)
  end
end
