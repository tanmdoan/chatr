class SenderRecipientValidator < ActiveModel::Validator
  def validate(record)
    if record.recipient_id == record.sender_id
      record.errors[:user] << 'Recipient and Sender cannot be the same'
    end
  end
end
