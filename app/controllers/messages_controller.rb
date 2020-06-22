class MessagesController < ApplicationController

  def index
    @messages = query_klass.resolve(
      relation: Message.all,
      filters: filters
    )
    render :success, json: @messages
  end

  def create
    @message = Message.create!(message_params)
    render json: @message, status: 201
  end

  private

  def filters
    params[:filters] ||= {}
  end

  def query_klass
    MessagesQuery
  end

  def message_params
    # TODO: not using strong params here, but in a production refactor
    # I would come back to convert to strong params
    # params.require(:message).permit(
    #   sender_id: params[:sender_id],
    #   recipient_id: params[:recipient_id],
    #   body: params[:body]
    # )

    {
      sender_id: params[:sender_id],
      recipient_id: params[:recipient_id],
      body: params[:body]
    }
  end
end


