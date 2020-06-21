require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  test "should not save message without a body" do
    message = Message.new

    assert_not message.save, 'Saved message without a body'
  end

  test "should save message with a body, sender, and recipient" do
    sender = users(:one)
    recipient = users(:two)

    message = Message.new(body: 'hi', recipient: recipient, sender: sender)

    assert message.save
  end

  test "should not save message when the sender and recipient is equal " do
    skip
    sender = users(:one)
    recipient = users(:one)

    message = Message.new(body: 'hi', recipient: recipient, sender: sender)

    assert_not message.save
  end
end
