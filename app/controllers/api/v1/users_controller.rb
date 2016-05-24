module Api::V1
  class UsersController < ApiController
  before_action :set_user, only: [:show, :update, :destroy]

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
      @user = User.new
    end

    # POST /v1/users
    def create
      @user = User.new(user_params)

      if @user.save
        render json: @user, status: :created, location: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /v1/users/1
    def update
      if @user.update(user_params)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end

    # DELETE /v1/users/1
    def destroy
      @user.destroy
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @user = User.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def user_params
        params.require(:user).permit(:name, :email)
      end
  end
end