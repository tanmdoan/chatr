require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @message = messages(:one)
    @user_one = users(:one)
    @user_two = users(:two)
  end

  test "should get index with filters but no limit" do
    get "/messages", params: { filters: { recipient_id: @user_one.id, sender_id: @user_two.id } }

    body = JSON.parse(response.body)

    assert_response :success
    assert_equal(body["data"].count, 4)
    assert_equal(body["data"].first["body"], @message.body)
  end

  test "should get index" do
    get "/messages", params: { }

    body = JSON.parse(response.body)

    assert_response :success
    assert_equal(body["data"].count, 7)
  end

  test "should get index with filters" do
    get "/messages", params: { filters: { limit: 3, recipient_id: @user_one.id, sender_id: @user_two.id } }

    body = JSON.parse(response.body)

    assert_response :success
    assert_equal(body["data"].count, 3)
    assert_equal(body["data"].first["body"], @message.body)
  end


  test "it should create message" do
    post "/messages", params: { sender_id: @user_one.id, recipient_id: @user_two.id, body: 'hi' }

    assert_response :created
    assert_equal(Message.count, 9)
  end

  test "it should not create message with non existent sender" do
    post "/messages", params: { sender_id: 123, recipient_id: @user_two.id, body: 'hi' }

    body = JSON.parse(response.body)

    assert_response :unprocessable_entity
    assert_equal(body['error'], "Sender must exist")
  end

  test "it should not create message with non existent recipient" do
    post "/messages", params: { sender_id: @user_one.id, recipient_id: 123, body: 'hi' }

    body = JSON.parse(response.body)

    assert_response :unprocessable_entity
    assert_equal(body['error'], "Recipient must exist")
  end

  test "it should not create message without body" do
    post "/messages", params: { sender_id: @user_one.id, recipient_id: @user_two.id }

    assert_response :unprocessable_entity
  end
end
