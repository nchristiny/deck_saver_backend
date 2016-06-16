class ApplicationController < ActionController::API
  include ActionController::Serialization
  include Authenticable

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  private

    def record_not_found
      render json: { "error": "Record not found" }, status: 404
    end
end
