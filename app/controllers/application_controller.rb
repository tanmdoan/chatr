class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordInvalid do |e|
    render status: :unprocessable_entity, json: {error: e.record.errors.full_messages.join('; ')}
  end

  rescue_from ActiveRecord::NotNullViolation do |e|
    render status: :unprocessable_entity, json: {error: 'Message body cannot be null'}
  end
end

