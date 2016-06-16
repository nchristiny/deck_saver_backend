module Authenticable
  def log_in(user)
    session[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.find_by(api_key: request.headers['Authorization'])
  end

  def authenticate_with_token!
    render json: { errors: "Not authenticated" }, status: :unauthorized unless logged_in?
  end

  def logged_in?
    current_user.present?
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
end
