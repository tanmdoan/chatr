class Message < ApplicationRecord
  belongs_to :recipient, class_name: 'User'
  belongs_to :sender, class_name: 'User'

  validates_with SenderRecipientValidator

  def self.default_scope
    order(created_at: :desc)
  end

  scope :within_thirty_days, -> { where(created_at: 30.days.ago..Time.current) }
end

