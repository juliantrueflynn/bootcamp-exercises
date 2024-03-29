class UsersController < ApplicationController
  before_action :require_current_user!, except: [:create, :new]
  def new
    @user = User.new(user_params)

    if @user.save
      render json: @user
    else
      render json: @user.errors.full_messages
    end
  end

  def create
    @user = User.new
  end

  def user_params
    params.require(:user).permit(:username, :password)
  end
end
