class SubsController < ApplicationController
  before_action :require_user_is_sub_creator, only: [:edit, :update]

  def index
    @subs = Sub.all
    render :index
  end

  def show
    @sub = Sub.find_by(id: params[:id])
    render :show
  end

  def edit
    @sub = Sub.find_by(id: params[:id])
    render :edit
  end

  def update
    @sub = Sub.find_by(id: params[:id])
    
    if @sub.update_attributes(sub_params)
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.creator_id = current_user.id
    
    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :new
    end
  end

  def new
    @sub = Sub.new(creator_id: current_user.id)
    render :new
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description, :creator_id)
  end

  def is_current_user_sub_creator?
    current_sub = Sub.find_by(id: params[:id])
    current_user.id == current_sub.creator_id
  end

  def require_user_is_sub_creator
    redirect_to subs_url unless is_current_user_sub_creator?
  end
end
