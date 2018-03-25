class CommentsController < ApplicationController
  before_action :authenticate_user!

  def index
    render :index
  end

  def new
    render :new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.link_id = params[:link_id]
    if @comment.save
      redirect_to link_url(@comment.link_id)
    else
      flash.now[:errors] = @comment.errors.full_messages
      render :new
    end
  end
  
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to link_url(@comment.link_id)
  end

  def authenticate_user!
    if current_user.nil?
      redirect_to new_session_url
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
