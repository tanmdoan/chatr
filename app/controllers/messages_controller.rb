class MessagesController < ApplicationController

  def index
    render :success, json: { data: Message.all }
  end

  def create
    if Message.create!(message_params)
      render :success
    end
  end

  def message_params
    {
      sender_id: params[:sender_id],
      recipient_id: params[:recipient_id],
      body: params[:body]
    }
  end
end
