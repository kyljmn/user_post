class PostsController < ApplicationController
  
  before_action :check_param_user_current_user, except: %i[index show]
  
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def edit
    @post = @user.posts.find(params[:id])
  end  
    
  def create
    @post = @user.posts.create(post_params)
    if @post.errors.any?
      render "new"
    else
      redirect_to user_posts_path
    end
  end

  def update
    @post = @user.posts.find(params[:id])
    if @post.update(post_params)
      redirect_to user_post_path(@user, @post)
    else
      render 'edit'
    end
  end
  
  def destroy
    @post = @user.posts.find(params[:id])
    @post.destroy
    redirect_to user_posts_path(@user)
  end
  
  private

    def post_params
      params.require(:post).permit(:title, :text)
    end

    def check_param_user_current_user
      :authenticate_user!
      @user = User.find(params[:user_id])
      redirect_if_not_auth
    end

    def redirect_if_not_auth
      redirect_to root_path if @user.id != current_user.id
    end
    
end
