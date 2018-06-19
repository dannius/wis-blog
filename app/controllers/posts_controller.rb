class PostsController < ApplicationController
  layout "simple", only: [:index]

  def index
    @posts = Post.where(user_id: params[:user_id])
  end

  def create
    @users = User.all
  end

  def show
    @post = Post.find_by_id([params[:id]])
  end
end
