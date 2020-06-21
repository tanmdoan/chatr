require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @message = messages(:one)
    @sender = users(:one)
    @recipient = users(:two)
  end

  test "should get index" do
    get "/messages", params: {}

    body = JSON.parse(response.body)

    assert_response :success

    assert_equal(body["data"].count, 2)
    assert_equal(body["data"].first["body"], @message.body)
  end

  test "it should create message" do
    post "/messages", params: { sender_id: @sender.id, recipient_id: @recipient.id, body: 'hi' }

    assert_response :success
    assert_equal(Message.count, 3)
  end
end
