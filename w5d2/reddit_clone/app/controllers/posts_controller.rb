class PostsController < ApplicationController
  before_action :require_post_author_to_edit, only: [:edit, :update]

  def show
    @post = Post.find_by(id: params[:id])
    render :show
  end

  def new
    @post = Post.new
    render :new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id

    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :new
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
    render :edit
  end

  def update
    @post = Post.find_by(id: params[:id])

    if @post.update_attributes(post_params)
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
      render :edit
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to subs_url
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :url, :sub_id, :author_id)
  end

  def is_current_user_author?
    current_user.id == params[:author_id]
  end

  def require_post_author_to_edit
    redirect_to subs_url unless is_current_user_author?
  end
end
