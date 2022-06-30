class ApplicationController < ActionController::API
  include ActionController::Cookies

  rescue_from ActiveRecord::RecordInvalid, with: :handle_invalid
  rescue_from ActiveRecord::RecordNotFound, with: :handle_not_found

  private

  def handle_invalid e
    render json: {errors: e.record.messages}, status: 422
  end

  def handle_not_found
    render json: {errors: e.record.messages}, status: 404
  end
end
