class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def require_current_user!
    redirect_to new_session_url if current_user.nil?
  end

  def current_user
    return nil if session[:session_token].nil?
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def login_user!(user)
    @current_user = user
    session[:session_token] = user.session_token
  end

  helper_method :current_user  
end
