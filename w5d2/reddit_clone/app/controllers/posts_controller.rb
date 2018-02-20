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
    @post = current_user.posts.new(post_params)

    if @post.save
      redirect_to post_url(@post)
    else
      flash.now[:errors] = @post.errors.full_messages
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
    params.require(:post).permit(:title, :content, :url, :author_id, sub_ids: [])
  end

  def is_current_user_author?
    current_user.id == params[:author_id]
  end

  def require_post_author_to_edit
    redirect_to subs_url if is_current_user_author?
  end
end
