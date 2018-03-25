class LinksController < ApplicationController
  before_action :authenticate_user!
  before_action :is_current_user?, only: [:update, :edit]

  def index
    render :index
  end

  def show
    @user = Link.find(params[:id])
    render :show
  end

  def new
    render :new
  end

  def create
    @link = Link.new(link_params)
    @link.user_id = current_user.id

    if @link.save
      redirect_to link_url(@link)
    else
      flash.now[:errors] = @link.errors.full_messages
      render :new
    end
  end

  def edit
    @link = Link.find(params[:id])
    render :edit
  end

  def update
    @link = current_user.links.find(params[:id])
    if @link.user_id == current_user.id && @link.update_attributes(link_params)

    else
      
    end
  end

  def authenticate_user!
    if current_user.nil?
      redirect_to new_session_url
    end
  end

  def is_current_user?
    params[:user_id] != current_user.id
  end

  private

  def link_params
    params.require(:link).permit(:title, :url)
  end
end
