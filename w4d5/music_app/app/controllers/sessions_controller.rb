class SessionsController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:email], params[:password])

    if user.nil?
      flash.now[:errors] = ["Incorrect email or password"]
      render :new
    else
      login!(user)
      redirect_to :new
    end
  end

  def destroy
    logout_user!
    redirect_to new_session_url
  end
end
