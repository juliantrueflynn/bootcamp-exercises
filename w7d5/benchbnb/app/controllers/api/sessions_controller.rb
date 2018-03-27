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
    sign_out
    render json: {}
  end
end
