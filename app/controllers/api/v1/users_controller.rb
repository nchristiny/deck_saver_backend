module Api::V1
  class UsersController < ApiController
  include ActionController::HttpAuthentication::Token::ControllerMethods
  before_action :set_user, only: [:show, :update, :destroy]
  # before_action :authenticate, only: [:create, :update, :destroy]

    # GET /v1/users
    def index
      render json: User.all
    end

    # GET /v1/users/1
    def show
      render json: @user
    end

    # GET /v1/users/new
    def new
    end

    # POST /v1/users
    def create
      user = User.new(user_params)

      if user.save
        render json: user, status: 201, location: [:api, user]
      else
        render json: { errors: user.errors }, status: 422
      end
    end

    # PATCH/PUT /v1/users/1
    def update
      if @user.update(user_params)
        render json: @user, status: 200, location: [:api, @user]
      else
        render json: { errors: @user.errors }, status: 422
      end
    end

    # DELETE /v1/users/1
     def destroy
       @user.destroy
       head 204
     end

     protected

     # Authenticate the user with token based authentication
     def authenticate
       authenticate_token || render_unauthorized
     end

     def authenticate_token
       authenticate_with_http_token do |token, options|
         @current_user = User.find_by(api_key: token)
       end
     end

     def render_unauthorized(realm = "Application")
       self.headers["WWW-Authenticate"] = %(Token realm="#{realm.gsub(/"/, "")}")
       render json: 'Bad credentials', status: :unauthorized
     end

    private
      def set_user
        @user = User.find(params[:id])
        head 404 and return unless @user.present?
      end

      def user_params
        params.require(:user).permit(:name, :email, :password, :api_key)
      end
  end
end
