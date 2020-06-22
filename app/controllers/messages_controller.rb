class MessagesController < ApplicationController

  def index
    render :success, json: {
      data: query_klass.resolve(
        relation: Message.all,
        filters: filters
      )
    }
  end

  def create
    if Message.create!(message_params)
      render :success
    end
  end

  private

  def filters
    params[:filters] ||= {}
  end

  def query_klass
    MessagesQuery
  end

  def message_params
    {
      sender_id: params[:sender_id],
      recipient_id: params[:recipient_id],
      body: params[:body]
    }
  end
end


