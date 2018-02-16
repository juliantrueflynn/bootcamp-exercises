class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if user.nil?
      render json: 'Wrong credentials'
    else
      user.reset_session_token!
      redirect_to cats_url
    end
  end

  def destroy
  end
end