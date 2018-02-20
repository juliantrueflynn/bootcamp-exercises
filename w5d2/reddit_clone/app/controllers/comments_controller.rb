class CommentsController < ApplicationController
  def new
    @comment = Comment.new(post_id: params[:post_id])
    render :new
  end

  def create
    @comment = current_user.comments.new(comment_params)

    if @comment.save!
      redirect_to subs_url
    else
      flash.now[:errors] = @comment.errors.full_messages
      render :new
    end
  end

  def edit
    @comment = Comment.new
    render :edit
  end

  def update
    @comment = Comment.find_by(id: params[:id])

    if @comment.update_attributes(comment_params)
      redirect_to post_url(params[:post_id])
    else
      flash.now[:errors] = @comment.errors.full_messages
      render :new
    end
  end

  def show
    @comment = Comment.find_by(id: params[:id])
    render :show
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :author_id, :post_id, :parent_comment_id)
  end
end
