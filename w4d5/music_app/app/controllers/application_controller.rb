class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  def log_in_user!(user)
    @current_user = user
    session[:session_token] = user.session_token
  end

  def current_user
    return nil if session[:session_token].nil?
    @current_user ||= User.find_by_session_token(session[:session_token])
  end

  def logged_in?
    ! self.current_user.nil?
  end
end
