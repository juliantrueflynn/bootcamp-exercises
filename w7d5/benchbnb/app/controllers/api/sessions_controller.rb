class Api::SessionsController < ApplicationController
  def create
    user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    
    if user
      sign_in(user)
      render json: user
    else
      render json: user.errors.full_messages
    end
  end

  def destroy
    sign_out
    render json: {}
  end
end
