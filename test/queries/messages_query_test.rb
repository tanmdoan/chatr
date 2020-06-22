require 'test_helper'

class MessagesQueryTest < ActiveSupport::TestCase
  def setup
    @recipient = users(:one)
    @sender = users(:two)
  end

  test "should return messages within thirty days with no filters" do
    assert_equal MessagesQuery.resolve(relation: Message.all).count, 7
  end

  test "should limit the number of returned messages" do
    filters = {
      limit: 8
    }

    assert_equal MessagesQuery.resolve(relation: Message.all, filters: filters).count, 8
  end

  test "should return messages by recipient" do

    filters = {
      recipient_id: @recipient.id
    }

    assert_equal MessagesQuery.resolve(relation: Message.all, filters: filters).count, 4
  end

  test "should return messages by sender" do
    filters = {
      sender_id: @sender.id
    }

    assert_equal MessagesQuery.resolve(relation: Message.all, filters: filters).count, 4
  end

  test "should return messages by sender and recipient" do
    filters = {
      sender_id: @sender.id,
      recipient_id: @recipient.id
    }

    assert_equal MessagesQuery.resolve(relation: Message.all, filters: filters).count, 4
  end
end
