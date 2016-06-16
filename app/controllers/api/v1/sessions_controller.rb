module Api::V1
  class SessionsController < ApiController
    def create
      handle_authentication_failure and return unless params[:session].present?
      email = params[:session][:email]
      password = params[:session][:password]
      user = User.find_by(email: email)

      if user.present? && user.authenticate(password)
        user.reload
        log_in(user)
        user.save
        render json: { :user => user, :api_key => user.api_key }, status: 201, location: [:api, user]
      else
        handle_authentication_failure
      end
    end

    def destroy
      log_out
      head 204
    end

    private

      def handle_authentication_failure
        render json: { errors: "Invalid email or password" }, status: 401
      end
  end
end
