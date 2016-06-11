module Api::V1
  class SessionsController < ApiController
    def create
      handle_authentication_failure and return unless params[:session].present?
      email = params[:session][:email]
      password = params[:session][:password]
      user = User.find_by_email(email)

      if user.present? && user.authenticate(password)
        user.reload
        user.save
        token = user.api_key
        render :json => { :user => user, :api_key => token },
        :status => 201
      else
        handle_authentication_failure
      end
    end

    def destroy

    end

    private

      def handle_authentication_failure
        head 401
      end
  end
end
