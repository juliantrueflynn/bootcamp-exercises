class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      render json: @comment
    else
      render json: @comment.errors.full_messages, status: :unprocessable_entity
    end
  end

  def index
    case
    when params['user_id']
      @comments = Comment.where(user_id: params['user_id'])
    when params['artwork_id']
      @comments = Comment.where(artwork_id: params['artwork_id'])
    else
      Comment.all
    end
    
    render json: @comments
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    render json: @comment
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :artwork_id, :body)
  end
end