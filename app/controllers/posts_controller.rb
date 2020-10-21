class PostsController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @posts = current_user.posts
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
    redirect_if_not_auth
  end  
    
  def create
    @post = current_user.posts.create(post_params)
    if @post.errors.any?
      render "new"
    else
      redirect_to posts_path
    end
  end

  def update
    @post = current_user.posts.find(params[:id])
    redirect_if_not_auth
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render 'edit'
    end
  end
  
  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end
  
  private

    def post_params
      params.require(:post).permit(:title, :text)
    end

    def redirect_if_not_auth
      redirect_to root_path if @post.user.id != current_user.id
    end

end
