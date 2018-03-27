class Api::SessionsController < ApplicationController
  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )
    
    if @user
      sign_in(@user)
      render json: @user
    else
      @user = User.new
      render json: ['Invalid login credentials'], status: 401
    end
  end

  def destroy
    @user = current_user
    
    if @user
      sign_out
      render json: @user
    else
      render json: ['Not logged in'], status: 404
    end
  end
end
