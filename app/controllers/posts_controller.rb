class PostsController < ApplicationController
  before_action :user_from_param, only: [:create, :delete]
  def create
    @post = @user.posts.create(posts_param)
    redirect_to user_path(@user)
  end
  def destroy
    @post = @user.posts.find(params[:id])
    @post.destroy
    redirect_to user_path(@user)
  end
  private
    def posts_param
      params.require(:post).permit(:title, :body)
    end
    def user_from_param
      @user = User.find(params[:user_id])
    end
end
