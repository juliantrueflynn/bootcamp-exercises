class UsersController < ApplicationController
  def index
    @users = User.all
    render :index
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new
    if @user.update_attributes(user_params)
      redirect_to users_url
    else
      flash.now[:errors] = ['Oops!']
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password_digest)
  end
end
