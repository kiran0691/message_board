class PostsController < ApplicationController
  # skip_before_filter :authenticate_user!, only: [:index]

  def index
    @posts = Post.all.paginate(:page => params[:page], :per_page => 5).order(created_at: :desc)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      render "new"
    end
  end

  def show
    @post = Post.find params[:id]
    @comment = @post.comments.new
    @comments = @post.comments.all.paginate(:page => params[:page], :per_page => 5)
  end

  def destroy
    @post = Post.find params[:id]
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit!
  end
end
